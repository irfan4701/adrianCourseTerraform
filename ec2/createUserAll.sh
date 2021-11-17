#!/bin/bash
#Irfan Patel
#02May2020
#Script to Create Multiple user with authorized key

name=(avinash.nage amritraj.singh irfan.patel pankaj.arak pradip.jaiswal sujit.jha sumit.babar)

key=("ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDevhbGvbrl7/YNmbxtiy8mYSXMLgJ626Yw+SD0uMFtt/vZG/5cHmFCxBDs1yU6Ymi0EYaWUbh72T38cTNKBngouAUGTsfU/0gEhuSMEHbDMhwElW9WdYYsmslrzBrVPiIHoBeusBDeGaXy5PUmnGWvHhvNbMXwF+Nhw5SK3IS9CLfRy0QebnbehSfyxUjlNOywKJ9Yn+lL/qWWhz/5G+I9b8eZgurjchWOISrrd2uQOCjo5YiBTe0IcLIeTwJWFqnPyEt/MDF0Jq4e9TKLtgYP48rV5rf86vCoTRcVAhcauEk8s6A++JEFqOlrYKvnovbVK5JSVCBjEmGxooxyRdYD amrit.singh@amrit-singh.jetsynthesys.net"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiGwLjNVbpy/ZSzs0P5nIh8RevaSU5+fCsjr1iNMuoYlCCgYXghxjhTtRzeIPPZhg6R6+++xPY5EqUr8rxcAWLlGCZlpkbELBzhMf9wjxmKlufJkXHhvTzu8+3uB5jzn3ZGdoZDvQan/yvgjE/SCcjhc4OFxydVgNz8LrSqGtguu8uePENqgejFgDvUtOa2sFf5dAzBEWkne4AjwLfOryVv526VLI62zt+FaLdr1nGw3y6dCr1us+oSuF+UnCy7vkkxt8jKZ4aPTLA41oQrfnYTyXsbl2nY+tHc8Op4LfpWYAw7WRZwTk1AvxRGVtL59OYGpTbbcZ/OH8mRE/jQnIn root@noc3"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkzCXsaEiXUES21sKUhXRwnGCIE7XvtPPKByxHGE5aH8XSZSQTnRkZe05NwDsOyj60+CcFEHqAQ79dLFoqoRw8KpvsEkb3kugCSAOZ3+NxsFiD3HduVyYW2eqAiUI+MnLDzX4Xniw0zZv7E59NTSbZzkH3ZAMyw9PsepEmXkHU7Hopk6MipAhmL9GEJFa9y/GvmQ13sXMIDdyUQUGRUIjMveV+b7oJ+BXJBQQo+wRw3/Wcx25euJMtzRHAxBfIrYC08JnKeDbN0d18GRsodhFiztl+pdAaLGH1YTy7l18ELMm0oaD8XMApb2SBcvckP64Q/lANOaPKIRShW9YnCIE9 amrit.singh@amrit-singh.jetsynthesys.net"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtxX/s++9UEJk4jUyy03Q3hd8fGQSCdatCOTMS0X0hFhj4dM0irE3bqClbtNc3JFsQC4F7yKSIom4BDY8frl0ETAbEJqPZrd0CU8RSDjknF50dPV4KD4a/RlUfqVXG84QhmLuHGx3pdFRdPxjhFdLmj/KQRPyaxRHoXHzS5L5BbbesWfyBrGmfbU3nUL6Ea7KY3yLC+Fvi8q+qtpKNNozruKDeoE2Eb+l72meSHz0QguP6p871gNj/+SS2md/F9wSsbmS0I/v+VP53ZBarhK7Bhn9X47JPGIbkRz/n++y63+pYNaKe2ZJtiUzeJJyHYZ2flJkVwbqgDRkLnE/IvsRF root@noc1.jetsynthesys.net"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgqeDhZNd9C/rFIT8Dx32Y9DYQC/oTLOZvy/jkEMJp7pnRBGbqFaMiHfOAXwt5eSI6YPmUHSIfXzURQIg0E7J4lwKwOYEjl4ASE6hr0/YQWMmZ8PUxEm+zX4TJp5TZpKtl6uD9Yi2Woa9QpiLJBI0KidaCos+VIlcioRmBaVOmZsYYuRIld2Q5NH3pYgy6nqFrI5goH1qzxo+DzQDf1FyfpSLu3A6CEZCmB71YVs9kJtvxJlKXsZ3yRLRwyqRX4nEHSrNvBwahi5dgEioTQLszQOCbTP9nLJWhaoGv4sSIvX0Kx+zY/jI4rTVgXmTaJyR0CeiNJjk7BxQ3dYhofbqV root@noc1.jetsynthesys.net"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCl09oGkO9vfYuqI2HryagyPH018taEkq4cgNFNHb+xmtz09LE1gwxvSVWfPps4GvOnu6hSxOrRerJdlpEvWeC1orDQsV+dVAQ7T98gYHJvtvC2bP5Kn8Qza2+BLWVXq/3XC70/RTaI7ve8TO9879Gt5KLH5dDBP7o/CvKyQdqfDF6AYdUiaXmDg/HUhOxOvsUPNui6bK5D5FGBb8ryevCG8KcNh52bFJt/zX5mCrRlvu3AfZC+jMso2MFjwIoofRNnrQxsPgj3Ad+VB/UkZPINhPS7wiMc3XtGnJik1yxahnKlZh3HD3qczpJLuOMZxMufxC4E6TgZoosfcqJiP1ch root@noc3"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9BY+DUcGeXf0ZzWwo42ZFmaEb/fTgPjhKbEQ5sqcLNvKbhiN5ZDRIsOoFkye8ACNbFHx+ftY5xL3QCLjsZ94EZj866SbIk42oa/rd68WAKWUKMON8QZOXGDeTcJaKdecmok3yhmLwOr2+wB0BmMzeh9oaW1s4Ahjo+jKxREaYpsljruJ45f/KM1YHiN6z5Po9aC3PtY8+fZqBRprsCVETPWnRnyIQJVe8YoIIdk8BMsbVXJpYIcm72X3nridXKyknNPY5gHav05+VrVSxTVORBV3gUpwrMItmnSw0EhVqGynnG60tYb5ly+ghAHLoOuF7J4eJx7jUhWda6ApGo/pT root@noc1.jetsynthesys.net")


for (( i=0; i<${#name[@]}; i++ ))
do
    echo creating user ${name[i]}
    if getent passwd ${name[i]} > /dev/null 2>&1
    then
        echo ${name[i]} already exist.
    else
        sudo useradd -m -s /bin/bash ${name[i]}
        install -g ${name[i]} -o ${name[i]} -m 700 -d /home/${name[i]}/.ssh
        install -g ${name[i]} -o ${name[i]} -m 400 /dev/null /home/${name[i]}/.ssh/authorized_keys
        sudo echo ${key[i]} >> /home/${name[i]}/.ssh/authorized_keys
        sudo cp /etc/sudoers.d/90-cloud-init-users /etc/sudoers.d/90-cloud-init-users_ORIG
        echo "${name[i]} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
    fi
done
