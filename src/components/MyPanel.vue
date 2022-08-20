<template>
    <div :class="['panel', 'align-vertical', { paneldark: darkmode }]">
        <div class="plate_split align-horizontal">
            <div :class="['plate', { platedark: darkmode }]">
                <img alt="" :class="['portrait', { platedark: darkmode }]" src="../img/azuki_cry.jpg" @click="click"
                    v-if="azuki_cry" />
                <img alt="" :class="['portrait', { platedark: darkmode }]" src="../img/azuki_lookup.jpg" @click="click"
                    v-else />
            </div>
        </div>
        <div :class="['maintitle']">Merlyn</div>
        <div :class="['loading_split', 'align-vertical']">
            <img v-if="loading" alt="" class="loading" src="../img/loading_.svg" />
            <img v-else alt="" class="enter" src="../img/angle-small-right.svg" @click="enter" />
            <div :class="[{ warn: prompt_warn }, 'prompt', { blink: prompt_blink }, { promptdark: darkmode }]">
                {{message}}
            </div>
        </div>
    </div>
</template>
<script>


export default {
    name: 'MyPanel',
    props: {},
    data() {
        return {
            azuki_cry: true,
            // portrait: "./img/azuki_cry.jpg",
            prompt: "主页正在施工捏",
            prompts: [
                ["憋点辣，宁已经点了", "次辣"],
                ["宁都点了", "次了，宁还是人？"],
                ["快爬呀！"]
            ],
            clickcount: 0,
            total_click: 0,
            prompt_warn: false,
            prompt_blink: false,
            darkmode: false,
            loading: false,
            message: "Page is under construction...",
        }
    },
    // TODO: uncomment this
    async mounted() {
        const axios = require('axios').default;
        await axios.get("https://api.merlyn.dev/statistics")
            .then((response) => {
                this.total_click = response.data;
                this.message = `Page is under construction... Visited ${this.total_click} times.`
            });
    },
    methods: {
        click() {
            this.cry = !this.cry;
            this.clickcount++;
            if (this.clickcount % 2 == 0) {
                // this.portrait = "./img/azuki_cry.jpg";
                this.azuki_cry = true;
                this.darkmode = false;
            } else {
                // this.portrait = "./img/azuki_lookup.jpg";
                this.azuki_cry = false;
                this.darkmode = true;
            }
            if (this.clickcount >= 1002) {
                window.opener = null;
                window.open("about:balnk", "_top").close();
            }
            if (this.clickcount >= 1000) {
                this.prompt = this.prompts[2][0];
                return;
            }
            if (this.clickcount >= 100) {
                this.prompt = this.prompts[1][0] + this.clickcount + this.prompts[1][1];
                return;
            }
            if (this.clickcount >= 10) {
                this.prompt = this.prompts[0][0] + this.clickcount + this.prompts[0][1];
                this.prompt_warn = true;
                this.prompt_blink = true;
            }
            setTimeout(() => {
                this.prompt_warn = false;
                this.prompt_blink = false;
            }, 1200);
            console.log(this.clickcount);
        },
        enter() {
            this.loading = true;
            this.message = "Loading...";
            setTimeout(() => {
                this.loading = false;
                this.message = "Just kidding. You can't enter any page because there're no other pages.";
            }, 5000);
        },
        provide: function () {
            return {
                portrait: this.portrait,
                click: this.click,
            }
        },
    }
}
</script>
<style>
.panel {
    width: 300px;
    min-height: 400px;
    margin-top: 10%;
    margin-bottom: 10%;
    /* height: 400px; */
    padding: 50px;
    border-radius: 10px;
    border-style: solid;
    border-color: rgba(255, 255, 255, 0.1);
    border-width: 1px;
    background-color: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(30px);
    -webkit-backdrop-filter: blur(30px);
}

.plate {
    width: 110px;
    height: 110px;
    border-radius: 50%;
    border-width: 1px;
    display: flex;
    justify-content: center;
    box-shadow: 0px 0px 15px 2px rgba(0, 0, 0, 0.2);
    background-color: rgba(255, 255, 255, 1);
    border-style: solid;
    border-color: rgb(209, 209, 209);
    -webkit-transition: box-shadow 0.5s ease-in-out, transform 0.5s ease-in-out;
    transition: box-shadow 0.5s ease-in-out, transform 0.5s ease-in-out;
}

.portrait {
    position: relative;
    margin: auto auto;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(226, 226, 226);
    filter: blur(0px);
    /* display: flex;
    flex-direction: column;
    justify-content: center; */
    align-items: center;
    -webkit-transition: transform 0.5s ease-in-out, filter 0.3s ease-in-out;
    transition: transform 0.5s ease-in-out, filter 0.3s ease-in-out;
    -webkit-user-drag: none;
}

.portrait:hover {
    filter: blur(1.5px) brightness(0.8);
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
}

.plate:hover {
    box-shadow: 2px 2px 20px 3px rgba(0, 0, 0, 0.15);
    -webkit-transform: translate(-.5px, -.5px);
    transform: translate(-.5px, -.5px);
}

.loading {
    width: 50px;
    height: 50px;
}

.enter {
    height: 26px;
    margin: 10px;
    filter: invert(1) opacity(0.7);
    border-radius: 50%;
    border-width: 2px;
    border-color: rgba(0, 0, 0, 0.5);
    border-style: solid;
    background-color: rgba(0, 0, 0, 0.0);
    transition: all 0.5s ease-in-out;
}

.enter:hover {
    filter: invert(1) opacity(1);
    border-color: rgba(0, 0, 0, 1);
    transform: rotate(360deg);
    /* background-color: rgba(0, 0, 0, 0.5); */
}
.plate_split {
    margin: auto auto;
    width: 100%;
}

.loading_split {
    height: 30%;
    width: 100%;
    /* display: flex;
    flex-direction: column; */
    padding-top: 15%;
    /* display: flex;
    justify-content: center; */
}

.prompt {
    text-align: center;
    font-weight: 200;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.5);
}

.align-vertical {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.align-horizontal {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}

.warn {
    color: rgb(255, 126, 126);
    font-weight: 500;
}

.maintitle {
    font-size: 30px;
    font-weight: 200;
    color: rgba(255, 255, 255, 0.5);
}

@keyframes blinker {
    from {
        opacity: 1.0;
    }

    to {
        opacity: 0.0;
    }
}

.blink {
    text-decoration: blink;
    animation-name: blinker;
    animation-duration: 0.2s;
    animation-iteration-count: infinite;
    animation-timing-function: ease-in-out;
    animation-direction: alternate;
}

.platedark {
    background-color: rgba(63, 63, 63, 0.76);
    border-color: rgba(66, 66, 66, 0.815);
}

.paneldark {
    border-color: rgba(0, 0, 0, 0.1) !important;
    background-color: rgba(0, 0, 0, 0.5) !important;
}

.promptdark {
    text-align: center;
    font-weight: 200;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.5) !important;
}
</style>