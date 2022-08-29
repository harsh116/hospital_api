const express = require("express");
const cors = require("cors");
const mysql = require("mysql");
const formData = require("express-form-data");

const PORT = 8080;

const corsOptions = {
  credentials: true,
};

// setting the directory of patient photo in upload folder
const options = {
  uploadDir: "uploads",
};

const app = express();

app.use(formData.parse(options));
app.use(express.json());

app.use(cors(corsOptions));

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "hospitals",
  multipleStatements: true,
});

app.post("/register", (req, res) => {
  const { name, address, email, phone_no, password } = req.body;
  const { patient_photo } = req.files;
  const patientPhotoPathname = patient_photo.path;

  // Regular expression for email address
  const emailPattern = /^\w+[@]\w+[.].+$/;
  // Regular expression for phone number with country code
  const phonePattern = /^\+[0-9]{11,13}$/;

  const addressCheck = address.length >= 10;

  const emailCheck = emailPattern.test(email);
  const phoneCheck = phonePattern.test(phone_no);
  const passwordcheck =
    /[A-Z]/.test(password) &&
    /[a-z]/.test(password) &&
    /\d/.test(password) &&
    password.length >= 8 &&
    password.length <= 15;

  if (!addressCheck) {
    res.status(400).json("Address must be of 10 characters");
    return;
  }

  if (!emailCheck) {
    res.status(400).json("Invalid email address");
    return;
  }

  if (!phoneCheck) {
    res.status(400).json("Invalid phone number");
    return;
  }

  if (!passwordcheck) {
    res
      .status(400)
      .json(
        "It must contain one upper character, one lower character and a number and must be 8 and 15 characters"
      );
    return;
  }

  // Store the registration details
  con.query(
    `use hospitals;
    insert into patients(name,address,email,phone_no,password,patient_photo_path)
    values ('${name}','${address}','${email}','${phone_no}','${password}','${patientPhotoPathname}')
        `,
    (err, result) => {
      if (err) {
        console.log(err);

        res
          .status(400)
          .json("Error while registering. Email address must be unique");
      } else {
        console.log(result);
        res.json("Registered");
      }
    }
  );
});

app.get("/fetch", (req, res) => {
  const { hospital_id } = req.body;

  if (hospital_id < 1 || hospital_id > 4) {
    res.status(400).json("Invalid hospital ID");
    return;
  }

  // console.log("body:", req.body);
  const sqlquery = `select hospital_id,count(psychiatrists.id) as  psychiatrist_count,
  sum(patients_count) as total_patients_count,hospital.name
  from psychiatrists,hospital
  where hospital.id=psychiatrists.hospital_id and hospital_id=${hospital_id};
  select id,name,patients_count from psychiatrists
  where hospital_id=${hospital_id};
  `;

  con.query(sqlquery, (err, result) => {
    if (err) {
      res.status(500).json("Some error while fetching");
      console.log(err);
      return;
    }

    console.log(result);
    let obj = {
      hospital_name: result[0][0].name,
      psychiatrist_count: result[0][0].psychiatrist_count,
      total_patients_count: result[0][0].total_patients_count,
      psychiatrist_details: [],
    };

    for (let i = 1; i < result[1].length; i++) {
      obj["psychiatrist_details"].push(result[1][i]);
    }

    res.json(obj);
  });
});

app.listen(PORT, () => {
  console.log(`app is running at url https://localhost:${PORT}`);
});
