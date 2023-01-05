<script setup lang="ts">
const props = defineProps(["tabs"])
const emit = defineEmits(["changeTab"])

function changeTab(newTab: string) {
    emit("changeTab", newTab)
}
</script>

<template>
    <div class="tabs-list">
        <div class="tab-item" v-for="tab in tabs" :key="tab.name" @click="changeTab(tab)" v-ripple>
            {{tab.label}}
        </div>
    </div>
</template>

<style scoped>
.tabs-list {
    padding: 15px 0 25px 0;

    flex: 1;
    width: 100%;

    display: flex;
    flex-direction: column;
    row-gap: 3px;
}

.tab-item {
    width: 100%;

    padding: 0.25rem 1rem;

    color: #fff;
    font-family: 'Roboto', sans-serif;
    font-weight: 400;
    font-size: 1.1rem;
}

.tab-item:hover {
    cursor: pointer;

    background: #fff;
    color: #000;
}
</style>
