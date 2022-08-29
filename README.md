# hospital_api

### Libraries and Framework Used:
1. **Express Js**: Provides rest api methods and have the most important method ie use() which is used to puts the specified middleware of the modules used.
2. **cors**: By default, cors is not enabled in nodejs app means client whose origin is different(not in nodejs folder) will not be able to send request or receive response. Using this, CORS is enabled.
3. **mysql**: As mysql database is used, so we need a driver for this to connect mysql to nodejs.
4. **express-form-data**: As files like patient photo is to be sent which is not raw text. So we need a module to parse multipart/form data. Also it is configured to parse the files in upload folder too.

### API Endpoints:
1. **register**('/register'):  This URI has payload containing 5 text fields ie name, address, email, phone_no and password and 1 file field ie patient_photo.
It checks validity of fields ie address,email, phone_no and password. If these fields are valid then alll data is pushed to table named 'patients' of database  'hospitals'. Patient photo is stored in upload folder saved with random string. So this random string is used to access it or send back to client later. So this pathname is stored in database.
2. **fetch**('/fetch'):  This URI has payload ie hospital_id. It checks if hospital id is valid. If valid then using functions like count to count the psychiatrists and sum to sum up number of patients, it fetch data from 2 tables psychiatrists(containing records of 50 psychiatrists),hospital(contains records of 4 hospitals). Here hospital_id is foreign key in psychiatrists table so its used to connect to hospital table to get the name of hospital using where clause.
Also we need records of psychiatrists so we need to records which matches the given hospital id. After the required information is obtained, its stored in object in specified format and sent in json format as response.