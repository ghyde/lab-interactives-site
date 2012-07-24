describe "SensorApplet class", ->

  applet = null

  beforeEach ->
    applet = new ISImporter.SensorApplet()

  it "should exist", ->
    expect( applet ).toBeDefined()

  describe "_appendHTML method", ->
    it "should exist and be callable", ->
      expect( typeof applet._appendHTML ).toBe 'function'

  describe "getHTML method", ->
    it "should defer to child class implementation", ->
      expect( applet.getHTML ).toThrow()

  describe "getState method", ->
    describe "initially", ->
      it "should return 'not appended'", ->
        expect( applet.getState() ).toBe 'not appended'

  describe "append method", ->

    beforeEach ->
      spyOn( applet, 'getHTML' ).andReturn '<applet> tag from getHTML method'
      spyOn( applet, '_appendHTML' )

    it "should call the getHTML method to request the applet HTML", ->
      applet.append()
      expect( applet.getHTML ).toHaveBeenCalled()

    it "should append the applet HTML to the DOM", ->
      applet.append()
      expect( applet._appendHTML ).toHaveBeenCalledWith '<applet> tag from getHTML method'

    it "should go into 'appended' state", ->
      applet.append()
      expect( applet.getState() ).toBe 'appended'

    describe "when the applet is in the 'not appended' state", ->

      beforeEach ->
        applet.getState = -> 'not appended'

      it "should not throw an error", ->
        expect( -> applet.append() ).not.toThrow()

    describe "when the applet is not in the 'not appended' state", ->

      beforeEach ->
        applet.getState = -> 'appended'

      it "should throw an error", ->
        expect( -> applet.append() ).toThrow()


  describe "after appending", ->
    it "should call the testAppletReady method in a timeout"

    describe "when testAppletReady returns false", ->
      it "should call the testAppletReady method again in a timeout", ->

    describe "when testAppletReady returns true", ->
      it "should go to the 'applet ready' state"

  describe "in the 'applet ready' state", ->
    it "should call the appletReady callback"

    describe "if sensorsReadyWhenAppletReady is true", ->
      it "should call the sensorsReady method"

  describe "the sensorIsReady method", ->

    it "should go to the 'stopped' state"

    describe "the start method", ->
      it "should call the _startSensor method"
      it "should call go to the 'start' state"

    describe "the stop method", ->
      it "should call the _stopSensor method"
      it "should go the the 'stopped' state"

  describe "initially", ->

    describe "inAppletCallback method", ->
      it "should return false"

    describe "after endAppletCallback is called", ->
      it "should throw an error"

    describe "after startAppletCallback method is called", ->
      describe "inAppletCallback method", ->
        it "should return true"

      describe "after startAppletCallback method is called again", ->
        it "should throw an error"

      describe "after endAppletCallback method is called", ->
        describe "inAppletCallack method", ->
          it "should return false"


describe "GoIOApplet class", ->

  it "should exist"
  it "should be a subclass of SensorsApplet"

  describe "getHTML method", ->
    # set appropriate otml file first!
    it "should construct an appropriate applet tag"

  describe "testAppletReady method", ->
    it "should call initSensorInterface method of the applet instance"
    it "should send the 'listenerPath' property to initSensorInterface"

    describe "if initSensorInterface throws an error", ->
      it "should return false"

    describe "if initSensorInterface does not throw an error", ->
      it "should return true"

  describe "sensorsReadyWhenAppletReady property", ->
    it "should be false"

  describe "sensorsReady method", ->
    it "should call startAppletCallback"

    it "should call sensorIsReady method while inAppletCallback is true"

    it "should call endAppletCallback"

  describe "The dataReceived method", ->

    it "should call startAppletCallback"

    it "should call newData callback while inAppletCallback is true"

    it "should call endAppletCallback"

  describe "_stopSensor method", ->
    describe "if inAppletCallback is true", ->
      it "should set a timer"
      describe "when the timer expires", ->
        it "should call the _stopSensor method again"

    describe "if inAppletCallack is false", ->
      it "should call the applet method stopCollecting"

  describe "_startSensor method", ->
    describe "if inAppletCallback is true", ->
      it "should set a timer"

      describe "when the timer expires", ->
        it "should call the _startSensor method again"

    describe "if inAppletCallack is false", ->
      it "should call the applet method startCollecting"


###

responsibilities of SensorApplet

  # SHOULD THERE BE a division of responsibility between SensorApplet and GoIOApplet?

  appends applet tag to DOM
  waits for applet startup
  records start and end of applet callback (should never call applet method within applet callback, apparently)
  removes applet tag from DOM when requested
reacords lifecycle of applet (not appended, appended, applet ready, sensors ready, removed)

responsibilities of GoIOApplet
  constructs appropriate applet tag



  forwards sensor ready event to callback
  forwards data received events to callback
  forwards metadata events to callback (if ever implemented)

###

