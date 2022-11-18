// Auto-generated. Do not edit!

// (in-package DF.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MsgRF {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.axis_x = null;
      this.axis_y = null;
      this.axis_setMode = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('axis_x')) {
        this.axis_x = initObj.axis_x
      }
      else {
        this.axis_x = 0;
      }
      if (initObj.hasOwnProperty('axis_y')) {
        this.axis_y = initObj.axis_y
      }
      else {
        this.axis_y = 0;
      }
      if (initObj.hasOwnProperty('axis_setMode')) {
        this.axis_setMode = initObj.axis_setMode
      }
      else {
        this.axis_setMode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgRF
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [axis_x]
    bufferOffset = _serializer.int32(obj.axis_x, buffer, bufferOffset);
    // Serialize message field [axis_y]
    bufferOffset = _serializer.int32(obj.axis_y, buffer, bufferOffset);
    // Serialize message field [axis_setMode]
    bufferOffset = _serializer.int32(obj.axis_setMode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgRF
    let len;
    let data = new MsgRF(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [axis_x]
    data.axis_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [axis_y]
    data.axis_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [axis_setMode]
    data.axis_setMode = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'DF/MsgRF';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0fc0b336c867cc76e65ffd4a8ba7649';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    int32 axis_x
    int32 axis_y
    int32 axis_setMode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgRF(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.axis_x !== undefined) {
      resolved.axis_x = msg.axis_x;
    }
    else {
      resolved.axis_x = 0
    }

    if (msg.axis_y !== undefined) {
      resolved.axis_y = msg.axis_y;
    }
    else {
      resolved.axis_y = 0
    }

    if (msg.axis_setMode !== undefined) {
      resolved.axis_setMode = msg.axis_setMode;
    }
    else {
      resolved.axis_setMode = 0
    }

    return resolved;
    }
};

module.exports = MsgRF;
