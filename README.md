Patient Document Management 

Patient Document Management is a system for managing the Medial Document in a Health Care Domain,
It let's Patient control the access of his/her private document and gives the authority to grant access to the requestor
which can be a Doctor or Pharmacist, only after accessing the grant Doctor or Pharmacist can view the 
Patient Medical Documents .

Getting Started
Please run below command to get system up and running

bundle install
rake db:migrate
rake db:seed

Prerequisites
You need to have Figaro and Devise gems in your gemfile

Test Data

Below are Test Data that are already in system ,

Patient Records

Name        email                   Documents                                    Password
Patient-2   patient2@email.com      X-Ray-1,MRI,OPD,Blood Test,                  abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription       
Patient-3   patient3@email.com      X-Ray-1,MRI,OPD,Blood Test,     			 abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription 
Patient-4   patient4@email.com      X-Ray-1,MRI,OPD,Blood Test,					 abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription
Patient-5   patient5@email.com      X-Ray-1,MRI,OPD,Blood Test,                  abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription
Patient-6   patient6@email.com      X-Ray-1,MRI,OPD,Blood Test,                  abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription
Patient-7   patient7@email.com      X-Ray-1,MRI,OPD,Blood Test,                  abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription
Patient-9   patient9@email.com      X-Ray-1,MRI,OPD,Blood Test,                  abcd1234
                                    Pain Presecription,Stomach Presecription,
                                    Dental Presecription,Cold Presecription

Doctor Records

Name        email                 Password          
Doctor-1    doctor1@email.com      abcd1234 
Doctor-2    doctor2@email.com      abcd1234
Doctor-3    doctor3@email.com      abcd1234
Doctor-4    doctor4@email.com      abcd1234

Pharmacist Records

Name          email                      Password
Pharmacist-1  pharmacist1@gmail.com      abcd1234
Pharmacist-2  pharmacist2@gmail.com      abcd1234
Pharmacist-3  pharmacist3@gmail.com      abcd1234

End to End Testing

Login/SignUP Testing

Login and Signup is being done using Devise gem with confirmable module enabled

Doctor/Pharmacist Role

The difference in below steps for a Doctor and Pharmacist is that Doctor can
request access only for 'Medical Record' and in case of Pharmacist it will be 'Prescription'

Step-1     After completing the signup form , a confirmation mail will be send to the provided emailID.
           Mail will be from a dummy admin emailID 'chauhanvanya24@gmail.com', this can be changed to any admin userName 
           by changing the application.yml and providing GMAIL_USERNAME and PASSWORD ENV variables

Step-2     After signin , list of all the patients in the system will be displayed ,you can select any patient ,after clicking
           select all the documents of that patient will be displayed, in the list either the status of the document request access will be shown if the role has already requested the document, status could be Pending, Approved or Rejected

Step-3     If the Document has never been requested by the role then a 'Request Access' link will be displayed after clicking
           on this link , a request will be sent to the patient and status will be changed to 'Pending' 

Step-4     After patients approval the status will be changed to 'Approved' and a link 'View Document' will be displayed
           On 'View Document' link click, a modal will pop up which will show the document details.

A Role can repeat this process for the same or different patient .

Patient Role

Step-1     After completing the signup form , a confirmation mail will be send to the provided emailID.
           Mail will be from a dummy admin emailID 'chauhanvanya24@gmail.com', this can be changed to any admin userName 
           by changing the application.yml and providing GMAIL_USERNAME and PASSWORD ENV variables

Step-2     All the pending requests will be displayed , with requestor details like name,email,and role 
           
Step-3     Patient can either approve or reject the request, after approval or rejection , request will be removed from the
           list 








