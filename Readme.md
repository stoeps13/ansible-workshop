# README

## Download Creative Commons License images

    cd images/cc
    for i in by-nc-sa by-nc-nd by-nc by by-nd by-sa
      do
        curl -L https://i.creativecommons.org/l/${i}/4.0/88x31.png --output ${i}.png
      done
