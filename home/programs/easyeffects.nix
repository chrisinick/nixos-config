{
  ...
}:
let
  equalizer = {
    band0Frequency = 29.95262336730957;
    band0Gain = 3.929999828338623;
    band0Mode = 6;
    band0Q = 1.5047602653503418;
    band10Type = 0;
    band11Type = 0;
    band12Type = 0;
    band13Type = 0;
    band14Type = 0;
    band15Type = 0;
    band16Type = 0;
    band17Type = 0;
    band18Type = 0;
    band19Type = 0;
    band1Frequency = 59.76333999633789;
    band1Gain = 6.510000228881836;
    band1Mode = 6;
    band1Q = 1.5047602653503418;
    band20Type = 0;
    band21Type = 0;
    band22Type = 0;
    band23Type = 0;
    band24Type = 0;
    band25Type = 0;
    band26Type = 0;
    band27Type = 0;
    band28Type = 0;
    band29Type = 0;
    band2Frequency = 119.24353790283203;
    band2Gain = 10.210000038146973;
    band2Mode = 6;
    band2Q = 1.5047602653503418;
    band30Type = 0;
    band31Type = 0;
    band3Frequency = 237.92214965820312;
    band3Gain = 8.329999923706055;
    band3Mode = 6;
    band3Q = 1.5047602653503418;
    band4Frequency = 474.7170715332031;
    band4Gain = 4.820000171661377;
    band4Mode = 6;
    band4Q = 1.5047602653503418;
    band5Frequency = 947.1851196289062;
    band5Gain = 0.2800000011920929;
    band5Mode = 6;
    band5Q = 1.5047602653503418;
    band6Frequency = 1889.8828125;
    band6Gain = 0.07999999821186066;
    band6Mode = 6;
    band6Q = 1.5047602653503418;
    band7Frequency = 3770.811767578125;
    band7Gain = -0.8299999833106995;
    band7Mode = 6;
    band7Q = 1.5047602653503418;
    band8Frequency = 7523.7587890625;
    band8Gain = 13.5;
    band8Mode = 6;
    band8Q = 1.5047602653503418;
    band9Frequency = 15011.8720703125;
    band9Gain = 18.510000228881836;
    band9Mode = 6;
    band9Q = 1.5047602653503418;
  };
in
{
  services.easyeffects = {
    enable = true;
    preset = "framework13pro";
    extraPresets = {
      framework13pro = {
        output = {
          blocklist = [ ];
          plugins_order = [
            "equalizer#0"
            "compressor#0"
            "limiter#0"
          ];
          "equalizer#0" = {
            inputGain = -19;
            numBands = 10;
          };
          "equalizer#0#left" = equalizer;
          "equalizer#0#right" = equalizer;
        };
      };
    };
  };
}
