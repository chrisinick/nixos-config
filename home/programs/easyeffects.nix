{
  ...
}:
{
  services.easyeffects = {
    enable = true;
    preset.output = "framework13pro";
    settings = {
      EffectsPipelines = {
        processAllInputs = false;
        processAllOutputs = false;
      };
      StreamInputs.listenToMic = false;
      StreamOutputs.outputDevice = "alsa_output.pci-0000_00_1f.3.analog-stereo";
    };
    extraPresets = {
      framework13pro = {
        "output" = {
          "blocklist" = [ ];
          "compressor#0" = {
            "attack" = 20.0;
            "boost-amount" = 6.0;
            "boost-threshold" = -72.0;
            "bypass" = false;
            "dry" = -80.01;
            "hpf-frequency" = 10.0;
            "hpf-mode" = "Off";
            "input-gain" = 0.0;
            "input-to-link" = -80.01;
            "input-to-sidechain" = -80.01;
            "knee" = -6.0;
            "link-to-input" = -80.01;
            "link-to-sidechain" = -80.01;
            "lpf-frequency" = 20000.0;
            "lpf-mode" = "Off";
            "makeup" = 0.0;
            "mode" = "Downward";
            "output-gain" = 0.0;
            "ratio" = 4.0;
            "release" = 100.0;
            "release-threshold" = -80.01;
            "sidechain" = {
              "lookahead" = 0.0;
              "mode" = "Peak";
              "preamp" = 0.0;
              "reactivity" = 10.0;
              "source" = "Middle";
              "stereo-split-source" = "Left/Right";
              "type" = "Feed-forward";
            };
            "sidechain-to-input" = -80.01;
            "sidechain-to-link" = -80.01;
            "stereo-split" = false;
            "threshold" = -12.0;
            "wet" = 0.0;
          };
          "equalizer#0" = {
            "balance" = 0.0;
            "bypass" = false;
            "decramp" = "Off";
            "input-gain" = -19.0;
            "left" = {
              "band0" = {
                "frequency" = 29.95262336730957;
                "gain" = 3.929999828338623;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band1" = {
                "frequency" = 59.76333999633789;
                "gain" = 6.510000228881836;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band2" = {
                "frequency" = 119.24353790283203;
                "gain" = 10.210000038146973;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band3" = {
                "frequency" = 237.92214965820313;
                "gain" = 8.329999923706055;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band4" = {
                "frequency" = 474.7170715332031;
                "gain" = 4.820000171661377;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band5" = {
                "frequency" = 947.1851196289063;
                "gain" = 0.2800000011920929;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band6" = {
                "frequency" = 1889.8828125;
                "gain" = 0.07999999821186066;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band7" = {
                "frequency" = 3770.811767578125;
                "gain" = -0.8299999833106995;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band8" = {
                "frequency" = 7523.7587890625;
                "gain" = 13.5;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band9" = {
                "frequency" = 15011.8720703125;
                "gain" = 18.510000228881836;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
            };
            "mode" = "IIR";
            "num-bands" = 10;
            "output-gain" = 0.0;
            "pitch-left" = 0.0;
            "pitch-right" = 0.0;
            "right" = {
              "band0" = {
                "frequency" = 29.95262336730957;
                "gain" = 3.929999828338623;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band1" = {
                "frequency" = 59.76333999633789;
                "gain" = 6.510000228881836;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band2" = {
                "frequency" = 119.24353790283203;
                "gain" = 10.210000038146973;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band3" = {
                "frequency" = 237.92214965820313;
                "gain" = 8.329999923706055;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band4" = {
                "frequency" = 474.7170715332031;
                "gain" = 4.820000171661377;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band5" = {
                "frequency" = 947.1851196289063;
                "gain" = 0.2800000011920929;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band6" = {
                "frequency" = 1889.8828125;
                "gain" = 0.07999999821186066;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band7" = {
                "frequency" = 3770.811767578125;
                "gain" = -0.8299999833106995;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band8" = {
                "frequency" = 7523.7587890625;
                "gain" = 13.5;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
              "band9" = {
                "frequency" = 15011.8720703125;
                "gain" = 18.510000228881836;
                "mode" = "APO (DR)";
                "mute" = false;
                "q" = 1.5047602653503418;
                "slope" = "x1";
                "solo" = false;
                "type" = "Bell";
                "width" = 4.0;
              };
            };
            "split-channels" = false;
          };
          "limiter#0" = {
            "alr" = false;
            "alr-attack" = 5.0;
            "alr-knee" = 0.0;
            "alr-knee-smooth" = -5.0;
            "alr-release" = 50.0;
            "attack" = 5.0;
            "bypass" = false;
            "dithering" = "None";
            "gain-boost" = true;
            "input-gain" = 0.0;
            "input-to-link" = -80.01;
            "input-to-sidechain" = -80.01;
            "link-to-input" = -80.01;
            "link-to-sidechain" = -80.01;
            "lookahead" = 5.0;
            "mode" = "Herm Thin";
            "output-gain" = 0.0;
            "oversampling" = "None";
            "release" = 5.0;
            "sidechain-preamp" = 0.0;
            "sidechain-to-input" = -80.01;
            "sidechain-to-link" = -80.01;
            "sidechain-type" = "Internal";
            "stereo-link" = 100.0;
            "threshold" = 0.0;
          };
          "plugins_order" = [
            "equalizer#0"
            "compressor#0"
            "limiter#0"
          ];
        };
      };
    };
  };
}
