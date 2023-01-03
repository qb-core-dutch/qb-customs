<script setup lang="ts">
const props = defineProps(["tabs"])
const emit = defineEmits(["changeTab"])

function changeTab(newTab: string) {
    emit("changeTab", newTab)
}
</script>

<template>
    <div class="tabs-list">
        <div class="tab-item" v-for="tab in tabs" :key="tab.name" @click="changeTab(tab.name)">
            {{tab.label}}
        </div>
    </div>
</template>

<style scoped>
.tabs-list {
    flex: 1;
    width: 100%;

    display: flex;
    flex-direction: column;
}
</style>
