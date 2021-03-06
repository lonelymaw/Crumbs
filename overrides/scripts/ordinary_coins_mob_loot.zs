#modloaded ordinarycoins
// Adds coin loot for each hostile mob based on 1/4th of its maximum health. Bronze coins by default, gold for bosses.

import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent) {
    if(event.damageSource.trueSource instanceof IPlayer & event.entityLivingBase instanceof IEntityMob) {
        event.addItem(calculateCoinLoot(event.entityLivingBase));
    }
});

function calculateCoinLoot(entity as IEntityLivingBase) as IItemStack {
    val coinCount = (entity.maxHealth / 6) as int;
    var coinType = <ordinarycoins:coinbronze> as IItemStack;
    if(entity.isBoss) {
        coinType = <ordinarycoins:coingold> as IItemStack;
    }
    return coinType * coinCount;
}