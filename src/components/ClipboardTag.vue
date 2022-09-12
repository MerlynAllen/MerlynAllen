<template>
      <div :class='["tag", {copied:copied}]' @click="copy"><slot></slot><div class="copy-icon"></div></div>
</template>

<script>
import { globals } from '@/global';
export default {
    name: 'ClipboardTag',
    props: ['data'],
    data() {
        return {
            copied: false,
            globals
        }
    },
    methods: {
        copy() { 
            navigator.clipboard.writeText(this.data).then(() => {
                this.copied = true;
                setTimeout(() => {
                    this.copied = false;
                }, 2000);
                this.globals.notify(`${this.data} copied to clipboard!`);
            }, () => {
                this.globals.notify(`Copy failed!`);
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
  display: flex;
  justify-content: center;
  align-items: center;
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

.copy-icon {
    background-image: url("@/img/copy-svgrepo-com.svg");
    width: 13px;
    height: 13px;
    margin: 0 0 0 10px;
    filter: invert(180);
    opacity: 0.5;
}
</style>