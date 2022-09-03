<template>
  <a @click="click">
    <img class="footer-icon" :src="src" />
  </a>
</template>
<script>
export default {
  name: "FooterIcon",
  props: ["src", "target"],
  data() {},
  methods: {
    click() {
      window.location = this.target;
    },
  },
};
</script>
<style scoped>
.footer-icon {
  filter: invert(100%) opacity(0.5);
  height: 100%;
  margin: 0px 15px;
  /* margin: 0% 1% 1% 1%; */
  transition: 0.5s ease-in-out;
}

.footer-icon:hover {
  filter: invert(100%) opacity(1);
  cursor: pointer;
}
</style>
