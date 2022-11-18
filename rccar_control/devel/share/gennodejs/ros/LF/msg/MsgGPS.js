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

class MsgGPS {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lati = null;
      this.longi = null;
    }
    else {
      if (initObj.hasOwnProperty('lati')) {
        this.lati = initObj.lati
      }
      else {
        this.lati = 0.0;
      }
      if (initObj.hasOwnProperty('longi')) {
        this.longi = initObj.longi
      }
      else {
        this.longi = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgGPS
    // Serialize message field [lati]
    bufferOffset = _serializer.float64(obj.lati, buffer, bufferOffset);
    // Serialize message field [longi]
    bufferOffset = _serializer.float64(obj.longi, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgGPS
    let len;
    let data = new MsgGPS(null);
    // Deserialize message field [lati]
    data.lati = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longi]
    data.longi = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'LF/MsgGPS';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '133854799976de73c17e7e3d8d5130e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 lati 
    float64 longi
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgGPS(null);
    if (msg.lati !== undefined) {
      resolved.lati = msg.lati;
    }
    else {
      resolved.lati = 0.0
    }

    if (msg.longi !== undefined) {
      resolved.longi = msg.longi;
    }
    else {
      resolved.longi = 0.0
    }

    return resolved;
    }
};

module.exports = MsgGPS;
