<template>
  <notify :class="[{ hidden: !notification_show }]">{{ notification }}</notify>
</template>

<script>
import { globals } from "@/global";
export default {
  name: "NotifyBox",
  data() {
    return {
      notification: "",
      notification_show: false,
      globals,
    };
  },
  mounted() {
    this.globals.notify = (msg) => {
      this.notification = msg;
      this.notification_show = true;
      setTimeout(() => {
        this.notification_show = false;
      }, 1500);
    };
  },
  methods: {},
};
</script>

<style>
notify {
  position: fixed;
  bottom: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 14px;
  font-weight: 400;
  padding: 10px 20px;
  border-radius: 10px;
  border-style: solid;
  border-width: 1px;
  backdrop-filter: blur(30px);
  -webkit-backdrop-filter: blur(30px);
  opacity: 1;
  transition: all ease-in-out 0.5s;
  color: rgba(255, 255, 255, 0.7);
  border-color: rgba(170, 200, 255, 0.5);
  background-color: rgba(170, 200, 255, 0.2);
}
notify.hidden {
  opacity: 0;
}
</style>