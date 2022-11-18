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

class MsgMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.modeA = null;
      this.modeB = null;
    }
    else {
      if (initObj.hasOwnProperty('modeA')) {
        this.modeA = initObj.modeA
      }
      else {
        this.modeA = false;
      }
      if (initObj.hasOwnProperty('modeB')) {
        this.modeB = initObj.modeB
      }
      else {
        this.modeB = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MsgMode
    // Serialize message field [modeA]
    bufferOffset = _serializer.bool(obj.modeA, buffer, bufferOffset);
    // Serialize message field [modeB]
    bufferOffset = _serializer.bool(obj.modeB, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MsgMode
    let len;
    let data = new MsgMode(null);
    // Deserialize message field [modeA]
    data.modeA = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [modeB]
    data.modeB = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'DF/MsgMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c191ef596c6c709f494df252088325a1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool modeA
    bool modeB
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MsgMode(null);
    if (msg.modeA !== undefined) {
      resolved.modeA = msg.modeA;
    }
    else {
      resolved.modeA = false
    }

    if (msg.modeB !== undefined) {
      resolved.modeB = msg.modeB;
    }
    else {
      resolved.modeB = false
    }

    return resolved;
    }
};

module.exports = MsgMode;
