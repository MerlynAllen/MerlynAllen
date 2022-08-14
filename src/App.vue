<template>

    <body class="align-horizontal">
        <div id="app" class="align-horizontal">
            <MyPanel>
            </MyPanel>
            <MyFooter></MyFooter>
        </div>
    </body>
</template>

<script>
import MyPanel from './components/MyPanel.vue'
import MyFooter from './components/MyFooter.vue'
export default {
    name: 'App',
    components: {
        MyPanel,
        MyFooter
    }
}
</script>

<style>
html,
body {
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

#app {
    width: 100%;
    /* display: flex;
            flex-direction: row;
            justify-content: center; */
    /* padding: 10%; */
    margin: 0;
}

.align-horizontal {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}
</style>
