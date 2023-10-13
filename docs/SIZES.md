# ATP
### Airgapped Transfer Protocol

---
## Packet Sizes
### For Optimal use and efficiency, the packet size should be chosen carefully.

##### The following parameters are of importance here:

#### 1. Amount of Data
OFC depending on how much data is being transfered, a single packet may be sufficient.

#### 2. Limitations of Transmission and/or reciever Devices
This can be practical [i.e. Framerate / Symbol Rate] or Technical [i.e. Sensor / Camera Resolution & Frame Rate].

#### 3. Required Error Correction
Is retransmission of packets an option? 
- Are Packets being buffered and Checksummed??

#### 4. Transmission Speed
How much "Packet Rate" is needed and/or desireable?
- Focus should be on background data transmission.

#### 5. Used Medium
How many packets are practical?
- Are there limitations [i.e. Duty Cycle of Frequency Useage]?

### [A comprehensive list of packet sizes are referenced here](docs/sizes.tsv) for ease of use.
#### Please feel free to contribute other options as well...
