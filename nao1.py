from naoqi import ALProxy
robotIP='192.168.10.108'
robotPort=9559
auto=ALProxy("ALAutonomousLife",robotIP,robotPort);
auto.setState("disabled");
motion=ALProxy("ALMotion",robotIP,robotPort)
motion.rest()
motion.wakeUp()
