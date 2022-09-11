<template>
    <div class="peer-info">
      <div class="peer-name"><slot></slot></div>
      <ClipboardTag :data="endpoint">Endpoint</ClipboardTag>
      <ClipboardTag :data="pubkey">Public Key</ClipboardTag>
      <ClipboardTag :data="asn">ASN</ClipboardTag>
      <ClipboardTag :data="linklocal">Link-Local IPv6</ClipboardTag>
      <ClipboardTag :data="ipv4">DN42 IPv4</ClipboardTag>
    </div>
</template>

<script>
import ClipboardTag from "./ClipboardTag.vue";
export default {
    name: "PeerInfo",
    components: {
        ClipboardTag
    },
    props: ["endpoint", "pubkey", "asn", "linklocal", "ipv4"],
}
</script>

<style>

.peer-info {
  color: rgba(255, 255, 255, 0.7);
  font-weight: 300;
  font-size: 30px;
  text-align: center;
  margin: auto 50px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.peer-name {
  font-size: 15px;
  font-weight: 400;
  letter-spacing: 3px;
  color: rgba(255, 255, 255, 0.5);
  text-align: center;
  padding: 8px 15px;
  margin: 10px 2px;
  border-radius: 10px;
  border-width: 1px;
  border-style: solid;
  border-color: rgba(170, 200, 255, 0.5);
  transition: 0.5s ease-in-out;
  background-color: rgba(170, 200, 255, 0.2);
}
</style>