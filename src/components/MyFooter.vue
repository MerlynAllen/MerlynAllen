<template>
    <div id="myfooter">
    <footer-icon :target="links['github']" :src="icons['github']"/>
    <footer-icon :target="links['telegram']" :src="icons['telegram']"/>
    <footer-icon :target="links['email']" :src="icons['email']"/>
    </div>
</template>
<script>
import FooterIcon from './FooterIcon.vue';
export default {
    name: 'MyFooter',
    props: {},
    components: {
        FooterIcon,
    },
    data() {
        return {
            links: {
                "github": "http://b-i.li/gh",
                "telegram": "http://b-i.li/tg",
                "email": "mailto:azuki@kkk.re",
            },
            icons: {
                "github": require('../img/github-brands.svg'),
                "telegram": require('../img/telegram-brands.svg'),
                "email": require('../img/email-svgrepo-com.svg'),
            }
        }
    },
}
</script>

<style>
#myfooter {
    position: fixed;
    left: auto;
    bottom: 0;
    width: 100%;
    height: 30px;
    padding-bottom: 1%;
    background-color: rgba(0, 0, 0, 0.0);
    color: white;
    text-align: center;
}
</style>