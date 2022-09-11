<template>
  <div :class="['panel-dn42', { paneldark: darkmode }]">
    <h1>
      Peer With Me @
      <div class="dn42-logo"></div>
    </h1>
    <div v-for="(peer, index) in peer_info" :key="index">
      <PeerInfo
        :endpoint="peer.endpoint"
        :pubkey="peer.pubkey"
        :asn="peer.asn"
        :linklocal="peer.linklocal"
        :ipv4="peer.ipv4"
        >{{ peer.name }}</PeerInfo
      >
    </div>
    <p>
      I use WireGuard as peering protocol.
      <span class="warn"
        >Port number of endpoints is the last five digits of your ASN.</span
      >Please contact me by Email with folowing information.<br />
      <br/>
      Your <u>ASN</u> + <u>Public IP</u> + <u>Port(default: 22380)</u> + <u>Public Key</u> + <u>IPv6 Link-Local Address</u> + <u>DN42 IPv4</u>
    </p>
  </div>
</template>

<script>
import PeerInfo from "./PeerInfo.vue";
export default {
  name: "PeerWithMe",
  components: { PeerInfo },
  data() {
    return {
      peer_info: [
        {
          name: "Tokyo-BGP1",
          endpoint: "tokyo.merlyn.eu.org",
          pubkey: "iHBahOdFjLlSPhd12L+cp5wgIT/+eWl0mjnahi8yNQ0=",
          asn: "AS4242422380",
          linklocal: "fe80::5400:4ff:fe1e:b4e9",
          ipv4: "172.22.125.254",
        },
        {
          name: "Los-Angeles-BGP2",
          endpoint: "la2.merlyn.eu.org",
          pubkey: "iHBahOdFjLlSPhd12L+cp5wgIT/+eWl0mjnahi8yNQ0=",
          asn: "AS4242422380",
          linklocal: "fe80::5400:4ff:fe1e:b4e9",
          ipv4: "172.22.125.253",
        },
      ],
    };
  },
};
</script>

<style>
.panel-dn42 {
  width: 50%;
  min-width: 400px;
  max-width: 500px;
  margin-top: 10%;
  margin-bottom: 10%;
  /* height: 400px; */
  padding: 10px 50px;
  border-radius: 10px;
  border-style: solid;
  border-color: rgba(255, 255, 255, 0.1);
  border-width: 1px;
  background-color: rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(30px);
  -webkit-backdrop-filter: blur(30px);
}
h1 {
  color: rgba(255, 255, 255, 0.7);
  font-weight: 400;
  font-size: 30px;
  text-align: center;
  padding: 30px 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
p {
  color: rgba(255, 255, 255, 0.7);
  letter-spacing: 1px;
  font-size: 15px;
  font-weight: 300;
  padding: 30px;
}

.dn42-logo {
  width: 130px;
  height: 30px;
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("https://dn42.eu/dn42.svg");
}

.warn {
  color: rgba(255, 0, 0, 0.37) !important;
  font-weight: 500;
}
u {
  text-underline-offset: 3px;
  color: rgba(0, 44, 70, 0.8);
  font-weight: 500;
  text-decoration: dotted underline;
}
</style>