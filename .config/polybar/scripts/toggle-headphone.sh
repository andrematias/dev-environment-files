#! /bin/bash
envFile=~/.config/polybar/scripts/toggle-headphone-env.sh

toggleOutput() {
  sed -i "s/OUTPUT=$1/OUTPUT=$2/g" $envFile 
  OUTPUT=$2
    case $OUTPUT in
      outline)
          echo "󰓃"
          pactl set-sink-port 0 analog-output-lineout 
        ;;
      headset)
          pactl set-sink-port 0 analog-output-headphones
          echo "󰋎"
        ;;
    esac
  echo "$OUTPUT"
}

case $1 in 
  toggle) 
    if [ "$OUTPUT" = outline ];
    then
      toggleOutput "$OUTPUT" headset
    else
      toggleOutput "$OUTPUT" outline
    fi
   ;;
  headset) 
    pactl set-sink-port 0 analog-output-headphones
   ;;
  lineout)
    pactl set-sink-port 0 analog-output-lineout 
    ;;
  default)
    case $OUTPUT in
      outline)
          echo "󰓃"
        ;;
      headset)
          echo "󰋎"
        ;;
    esac
    ;;
esac
