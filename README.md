# Install Docker itself if you don't have it already.

  * Mac installer

  * Windows installer

  * On linux:

```bash
sudo apt install docker.io
sudo service docker restart
sudo addgroup $USER docker
newgrp docker
```

# Pull the image.
(This is the slow thing; it includes a couple GB of Ubuntu.)

```bash
    docker pull jonhdotnet/summer_school:1.0
```

# Test that the image works
```bash
​    docker container run -t -i jonhdotnet/summer_school:1.0 /bin/bash
    dafny test.dfy
```

If everything is working, you should see:

```bash
Dafny 2.3.0.10506
test.dfy(3,0): Error BP5003: A postcondition might not hold on this return path.

test.dfy(2,12): Related location: This is the postcondition that might not hold.

Execution trace:
    (0,0): anon0

Dafny program verifier finished with 0 verified, 1 error
```

# Use the image

Run the image connected to your filesystem so you can edit in your OS, and then run Dafny from inside the docker container:

```bash
mkdir work
cd work
docker container run -t -i --mount src="`pwd`",target=/home/dafnyserver/work,type=bind --workdir /home/dafnyserver/work jonhdotnet/summer_school:1.0 /bin/bash
git clone https://github.com/GLaDOS-Michigan/summer-school-2020.git
cd tutorial/chapter01
```
