<script setup lang="ts">
import {ref} from 'vue'
import type {Ref} from 'vue'
import type {Tab} from '@/utils'
import {Tabs} from '@/utils'

import Header from '@components/Header.vue'
import TabsList from '@components/TabsList.vue'

const customsName: Ref<string> = ref(process.env.NODE_ENV == "development" ? "QB-Customs" : "")
const helpText: Ref<string> = ref("Choose a tab")
const tabs: Ref<Tab[]> = ref(Tabs)
const currentTab: Ref<Tab | null> = ref(null)

function changeTab(newTab: string) {
    currentTab.value = newTab
}
</script>

<template>
    <v-app>
        <div class="main">
            <Header :name="customsName" :helpText="helpText" />
            <TabsList :tabs="tabs" v-if="currentTab == null" @changeTab="changeTab"/>
        </div>
    </v-app>
</template>

<style scoped>
.main {
    height: calc(100% - 5vh);
    max-height: 1080px;

    min-width: 400px;
    max-width: calc(100vw / 3);

    background: #151a1f;
    border-radius: 6px 6px 3px 3px;
    overflow: hidden;
    
    position: absolute;
    top: 2.5vh;
    right: 2.5vh;

    display: flex;
    flex-direction: column;
}
</style>
