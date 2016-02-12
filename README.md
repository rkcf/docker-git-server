Docker SSH Git Server
=================
A docker container to use as a remote git over SSH code repository.

Setup
-----
Copy your SSH public key into your build directory, named as git_key.pub.

Build your container:
```
docker build -t your-name/git_ssh_srv .
```

Start your container:
```
docker run --detach --restart=unless-stopped:3 --publish 8080:22 --name git_ssh_srv your-name/git_ssh_srv
```

Usage
-----
For easier ssh use add something like this to your ~/.ssh/config:
```
Host www.example.com
	IdentityFile /path/to/your/ssh/key
	User root
	Port 8080
```

Create and transfer a repository to your host:
```
git init --bare project.git
scp -r project.git www.example.com:/git
```

Clone your repository:
```
git clone ssh://www.example.com/git/project.git
```

Misc
----
[Official Git over SSH Docs](https://www.git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key)
