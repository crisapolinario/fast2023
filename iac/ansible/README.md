Requirements:

    - Vagrant https://www.vagrantup.com/downloads.html
    - Virtualbox https://www.virtualbox.org/wiki/Downloads

1 - Configure hosts file - Add those lines in /etc/hosts

``` console
127.0.0.1  fast.school
127.0.0.1  sonar.fast.school
127.0.0.1  awx.fast.school
127.0.0.1  jenkins.fast.school
```

2 - Clone repository

```console
$ git clone 
```

3 - Access directory with code

```console
$ cd DevOps/ansible/playbooks/cicd-workshop
```

4 - Start infrastructure

```console
$ sudo vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'centos/7'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'centos/7' version '1905.1' is up to date...
==> default: Setting the name of the VM: cicd_default_1565714204727_69186
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: You are trying to forward to privileged ports (ports <= 1024). Most
==> default: operating systems restrict this to only privileged process (typically
==> default: processes running as an administrative user). This is a warning in case
==> default: the port forwarding doesn't work. If any problems occur, please try a
==> default: port higher than 1024.
==> default: Forwarding ports...
    default: 80 (guest) => 80 (host) (adapter 1)
    default: 1936 (guest) => 1936 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: No guest additions were detected on the base box for this VM! Guest
    default: additions are required for forwarded ports, shared folders, host only
    default: networking, and more. If SSH fails on this machine, please install
    default: the guest additions and repackage the box to continue.
    default:
    default: This is not an error message; everything may continue to work properly,
    default: in which case you may ignore this message.
==> default: Rsyncing folder: /Users/caboe/Vagrant/cicd/ => /vagrant
==> default: Running provisioner: ansible...
Vagrant has automatically selected the compatibility mode '2.0'
according to the Ansible version installed (2.8.2).

Alternatively, the compatibility mode can be specified in your Vagrantfile:
https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode

    default: Running ansible-playbook...

PLAY [Start CI CD] *************************************************************

TASK [Gathering Facts] *********************************************************
ok: [default]

TASK [config server] ***********************************************************
included: /Users/caboe/Vagrant/cicd/config-server.yml for default

TASK [install epel-release] ****************************************************
changed: [default]

TASK [install dependences - yum] ***********************************************
changed: [default]

TASK [install dependences - pip] ***********************************************
changed: [default]

TASK [check docker-ce repository] **********************************************
ok: [default]

TASK [add docker-ce repository] ************************************************
changed: [default]

TASK [install docker-ce] *******************************************************
changed: [default]

TASK [start docker] ************************************************************
changed: [default]

TASK [start docker swarm] ******************************************************
changed: [default]

TASK [copy config files to build images] ***************************************
changed: [default] => (item=awx)
changed: [default] => (item=jenkins)

TASK [create files to build images] ********************************************
changed: [default] => (item={'dir': 'awx', 'file': 'Dockerfile-task'})
changed: [default] => (item={'dir': 'awx', 'file': 'Dockerfile-web'})
changed: [default] => (item={'dir': 'jenkins', 'file': 'Dockerfile'})
changed: [default] => (item={'dir': 'jenkins', 'file': 'config.xml'})

TASK [build jenkins image] *****************************************************
changed: [default]

TASK [build awx images] ********************************************************
changed: [default] => (item=web)
changed: [default] => (item=task)

TASK [create docker compose to deploy stack] ***********************************
changed: [default]

TASK [deploy stack] ************************************************************
changed: [default]

TASK [remove temp files] *******************************************************
changed: [default] => (item=/tmp/awx)
changed: [default] => (item=/tmp/jenkins)

PLAY RECAP *********************************************************************
default                    : ok=17   changed=14   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0`

```

5 - Access the services:

    Credentials for all services 
        User: admin
        Pass: admin
    
 - Traefik - http://fast.school:1936
 
![traefik.png](images/traefik.png)

 - Jenkins - http://jenkins.fast.school
 
![jenkins_login.png](images/jenkins_login.png)
![jenkins_dash.png](images/jenkins_dash.png)

 - AWX - http://awx.fast.school
 
![awx_login.png](images/awx_login.png)
![awx_dash.png](images/awx_dash.png)

 - Sonar - http://sonar.fast.school
 
![sonar_login.png](images/sonar_login.png)
![sonar_dash.png](images/sonar_dash.png)
