local Hi = require 'well_hello_there'
local Creds = require 'database'

DB = db.connect{
   api      = db.MY_SQL,
   name     = Creds.database,
   user     = Creds.username,
   password = Creds.password
}

function main(Data)
   
   
   trace(Creds.database)
   trace(Creds.username)
   trace(Creds.password)
   
   
   local MsgIn = hl7.parse{vmd='example/demo.vmd', data=Data}
   local TableOut = db.tables{vmd='tables.vmd', name='ADT'}
   MapPatient(TableOut.Patient[1], MsgIn.PID)
   DB:merge{data=TableOut, live=false}
end

function MapPatient(Patient, PID)
   Patient.Id        = PID[3][1][1]
   Patient.FirstName = PID[5][1][2]
   Patient.LastName  = PID[5][1][1][1]
   Patient.Gender    = PID[8]   
   return Patient
end