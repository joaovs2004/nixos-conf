{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    style = ''
      window {
        margin: 0px;
        border: 2px solid #191919;
        border-radius: 5px;
        background-color: #0f0f0f;
        font-family: monospace;
        font-size: 12px;
      }

      #input {
        margin: 5px;
        border: 1px solid #4c4c4c;
        color: #bfbfbf;
        background-color: #0f0f0f;
      }

      #input:focus {
        border-color: #8a98ac#
      }

      #input image {
        color: #bfbfbf;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #0f0f0f;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #0f0f0f;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #e7e7e7;
      }

      #entry:selected {
        background-color: #4c4c4c;
        font-weight: normal;
      }

      #text:selected {
        background-color: #4c4c4c;
        font-weight: normal;
      }
    '';

  };
}
