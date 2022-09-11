<template>

    <body class="align-horizontal">
        <div id="app" class="align-horizontal">
            <MyBanner v-on:now_showing="change_showing"></MyBanner>
            <MyPanel v-show='now_showing == "panel"'>
            </MyPanel>
            <PeerWithMe v-show='now_showing == "dn42"'></PeerWithMe>
            <MyFooter></MyFooter>
        </div>
    </body>
</template>

<script>
import MyPanel from './components/MyPanel.vue'
import MyFooter from './components/MyFooter.vue'
import MyBanner from './components/MyBanner.vue';
import PeerWithMe from './components/PeerWithMe.vue';
export default {
    name: 'App',
    components: {
    MyPanel,
    PeerWithMe,
    MyFooter,
    MyBanner,
},
    data() {
        return {
            now_showing:'panel',
        }
    },
    methods: {
        change_showing(page) { 
            this.now_showing = page;
        }
    },
}
</script>

<style>
html {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    /* display: flex;
    flex-direction: column;
    justify-content: center; */
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    background-image: url(./img/bg.webp);
    background-repeat: no-repeat;
    background-position: bottom center;
    background-attachment: fixed;
    background-size: cover;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
body {

    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    border: 0;
}

#app {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    /* display: flex;
            flex-direction: row;
            justify-content: center; */
    /* padding: 10%; */
}

.align-horizontal {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}
</style>
