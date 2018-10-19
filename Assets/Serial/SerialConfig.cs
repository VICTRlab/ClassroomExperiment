/*
 * SerialConfig component
 * 
 * See configuration section in Serial script for information on how to use this script.
 * 
 */

using System.Collections;
using System.Collections.Generic;
using System.IO.Ports;
using UnityEngine;

public class SerialConfig : MonoBehaviour {

    public string portName = "COM3";
    public int speed = 115200;
    public Parity parity = Parity.None;
    public int dataBits = 8;
    public StopBits stopBits = StopBits.One;

	/// <summary>
	/// Log some debug informations to the console to help find what's wrong when needed.
	/// </summary>
	public bool logDebugInfos = false;
}
