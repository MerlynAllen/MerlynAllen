<template>
    <div id="myfooter">
        <a :href="github_link">
            <img class="footer-icon" src="../img/github-brands.svg" :href="github_link" />
        </a>
        <a :href="telegram_link">
            <img class="footer-icon" src="../img/telegram-brands.svg" />
        </a>
        <a :href="email_link">
            <img class="footer-icon" src="../img/email-svgrepo-com.svg" />
        </a>
    </div>'
</template>
<script>
export default {
    name: 'MyFooter',
    props: {},
    data() {
        return {
            github_link: "http://b-i.li/gh",
            telegram_link: "http://b-i.li/tg",
            email_link: "mailto:azuki@kkk.re"
        }
    },
}
</script>

<style>
.footer-icon {
    filter: invert(100%) opacity(0.5);
    height: 100%;
    margin: 0px 15px;
        /* margin: 0% 1% 1% 1%; */
    transition: 0.5s ease-in-out;
}

.footer-icon:hover {
    filter: invert(100%) opacity(1);
}

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