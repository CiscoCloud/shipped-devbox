# shipped-devbox

This code builds the developer Vagrant box for Cisco Shipped.


#### Provides:
* CentOS 7 x86_64 (minimal)
* Docker
* Docker-compose


#### Build Requirements:
* VirtualBox >= 4.3.14 [Download](https://www.virtualbox.org/wiki/Downloads)
* Packer [Download](https://www.packer.io/downloads.html)
* make
* internet access

Packer installation note: copy the executables to `/usr/local/bin`


#### Build:
```
$ make all

```

#### Provision:
```
$ make install
$ vagrant up
```


#### Artifact:
Artifacts are manually promoted to https://atlas.hashicorp.com/CiscoCloud/boxes/shipped-devbox


#### License:
Copyright © 2015 Cisco Systems, Inc.

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) (the "License").

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
