<template>
    <div id="mybanner">
        <div class="banner-item" @click="home">HOME</div>
        <div class="banner-item" @click="dn42">DN42</div>
        <div class="banner-item" @click="merlynsaid">:D</div>
    </div>
</template>
<script>
export default {
    name: 'MyFooter',
    props: {},
    data() {
        return {
            blog_link: "https://b-i.li/merlynsaid"
        }
    },
    methods: {
        merlynsaid() {
            window.location = this.blog_link;
        },
        dn42() { 
            this.$emit('now_showing', 'dn42');
        },
        home() { 
            this.$emit('now_showing', 'panel')
        }
    },
}
</script>

<style>
#mybanner {
    position: fixed;
    display: flex;
    left: auto;
    top: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.0);
    color: white;
    text-align: center;
    flex-direction: row;
    justify-content: right;
}

.banner-item {
    font-size: 15px;
    font-weight: 400;
    letter-spacing: 3px;
    color: rgba(255, 255, 255, 0.5);
    text-align: center;
    padding: 8px 15px;
    margin: 10px 2px;
    border-radius: 1000px;
    border-width: 1px;
    border-style: solid;
    border-color: rgba(255, 255, 255, 0.0);
    transition: 0.5s ease-in-out;
    background-color: rgba(255, 255, 255, 0.0);
}

.banner-item:hover {
    color: rgba(255, 255, 255, 1);
    background-color: rgba(255, 255, 255, 0.3);
    /* backdrop-filter: blur(5px); */
    border-color: rgba(255, 255, 255, 0.2);
}
</style>