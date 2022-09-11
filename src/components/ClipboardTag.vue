<template>
      <div :class='["tag", copied?"copied":1]' @click="copy"><slot></slot></div>
</template>

<script>
export default {
    name: 'ClipboardTag',
    props: ['data'],
    data() {
        return {
            copied: false,
        }
    },
    methods: {
        copy() { 
            navigator.clipboard.writeText(this.data).then(() => {
                this.copied = true;
                setTimeout(() => {
                    this.copied = false;
                }, 2000);
            }, () => {
                alert("Copying to clipboard failed.");
            });
        },
    },
}
</script>

<style>

.tag {
  font-size: 15px;
  font-weight: 400;
  letter-spacing: 1px;
  color: rgba(255, 255, 255, 0.5);
  text-align: center;
  padding: 8px 15px;
  margin: 10px 2px;
  border-radius: 1000px;
  border-width: 1px;
  border-style: solid;
  border-color: rgba(255, 255, 255, 0.3);
  transition: 0.5s ease-in-out;
  background-color: rgba(255, 255, 255, 0);
}

.tag:hover {
  color: rgba(255, 255, 255, 1);
  background-color: rgba(255, 255, 255, 0.3);
  /* backdrop-filter: blur(5px); */
  border-color: rgba(255, 255, 255, 0.2);
}
.copied {
  border-color: rgba(178, 255, 180, 0.5) !important;
  background-color: rgba(178, 255, 180, 0.3) !important;
}

</style>