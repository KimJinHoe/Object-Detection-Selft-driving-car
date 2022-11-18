// Auto-generated. Do not edit!

// (in-package DMF.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MsgnCurLane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nCurLane = null;
    }
    else {
      if (initObj.hasOwnProperty('nCurLane')) {
        this.nCurLane = initObj.nCurLane
      }
      else {
        this.nCurLane = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgnCurLane
    // Serialize message field [nCurLane]
    bufferOffset = _serializer.int32(obj.nCurLane, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgnCurLane
    let len;
    let data = new MsgnCurLane(null);
    // Deserialize message field [nCurLane]
    data.nCurLane = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'DMF/MsgnCurLane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dbea93705dcaf6e7297bfe685098a446';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 nCurLane
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgnCurLane(null);
    if (msg.nCurLane !== undefined) {
      resolved.nCurLane = msg.nCurLane;
    }
    else {
      resolved.nCurLane = 0
    }

    return resolved;
    }
};

module.exports = MsgnCurLane;
