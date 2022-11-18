// Auto-generated. Do not edit!

// (in-package LF.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MsgDetect {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detect = null;
    }
    else {
      if (initObj.hasOwnProperty('detect')) {
        this.detect = initObj.detect
      }
      else {
        this.detect = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgDetect
    // Serialize message field [detect]
    bufferOffset = _serializer.int32(obj.detect, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgDetect
    let len;
    let data = new MsgDetect(null);
    // Deserialize message field [detect]
    data.detect = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'LF/MsgDetect';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3cbf5ce45bbe7286edd5b1ffe23d39a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 detect
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgDetect(null);
    if (msg.detect !== undefined) {
      resolved.detect = msg.detect;
    }
    else {
      resolved.detect = 0
    }

    return resolved;
    }
};

module.exports = MsgDetect;
