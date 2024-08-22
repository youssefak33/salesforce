trigger CalloutTrigger on Account (before insert, before update) {
    Callout.makeCallout();
}