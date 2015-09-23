local Hello = require 'well_hello_there'

function main(RawMsgIn)
   iguana.stopOnError(false)
   local MsgIn, MsgType  = hl7.parse{vmd='example/demo.vmd', data=RawMsgIn}
   local MsgOut = hl7.message{vmd='example/demo.vmd', name=MsgType}
   MsgOut:mapTree(MsgIn)
   MsgOut.MSH[3][1] = 'MyDEMO'
   local RawMsgOut = tostring(MsgOut)
   queue.push{data=RawMsgOut}
end