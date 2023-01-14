//
//  Activity.swift
//  SpiritualGrowth1.0
//
//  Created by Brian Cordeau on 12/26/22.
//

import Foundation
import UIKit

var spiritualDisciplines = [
    Activity(title:"Pray", name:"Pray for last person you talked to"),
    Activity(title:"Pray", name:"Pray for for the person you last emailed"),
    Activity(title:"Journal", name:"Spend an hour journaling about a topic that you have been thinking about"),
    Activity(title:"Study", name:"Study a characteristic of Jesus"),
    Activity(title:"Read", name:"Read Psalm 119"),
    Activity(title:"Give", name:"Give to a cause you have been thinking about"),
    Activity(title:"Pray", name:"Spend 15 minutes listening to God"),
    Activity(title:"Read", name:"Start a new devotional today"),
    Activity(title:"Listen", name:"Find a Podcast to listen to on a spiritual discipline"),
    Activity(title:"Fast", name:"Fast from your 'go-to' website for three days"),
    Activity(title:"Give", name:"Sign up for a one time volunteer event in your area"),
    Activity(title:"Pray", name:"Take a walk around your neighborhood, praying for the people in each house as you go by"),
    Activity(title:"Listen", name:"Play some hymns as you go about your day"),
    Activity(title:"Give", name:"Secretly buy someone's lunch this week"),
    Activity(title:"Listen", name:"Listen to a sermon on a topic you are interested in."),
    Activity(title:"Fast", name:"Do not use social media today"),
    Activity(title:"Fast", name:"Take your negative thoughts captive and pray against them"),
    Activity(title:"Pray", name:"Pray for a child in your life."),
    Activity(title:"Community", name:"Send your pastor a word of encouragement "),
    Activity(title:"Give", name:"Send a gift to someone you know who is lonely"),
    Activity(title:"Community", name:"Do something kind for your neighbor"),
    Activity(title:"Pray", name:"Pray for the difficult coworker"),
    Activity(title:"Read", name:"Find a book to read on a topic you have been struggling with, ask your pastor for a suggestion and go with it."),
    Activity(title:"Pray", name:"Pray with someone today"),
    Activity(title:"Community", name:"Ask for forgiveness for a hurt you have caused, or forgive someone who has hurt you"),
    Activity(title:"Community", name:"Join a bible study with people of the same sex."),
    Activity(title:"Community", name:"Send a word of encouragement to the person on your mind"),
    Activity(title:"Give", name:"Take a shelter dog out for a walk"),
    Activity(title:"Give", name:"Volunteer to sort food at your local food bank"),
    Activity(title:"Journal", name:"Journal through the book of James this week"),
    Activity(title:"Give", name:"Buy groceries for the person in line in front of you"),
    Activity(title:"Pray", name:"Go on a hike at a park, praying for the last three people you talked to"),
    Activity(title:"Give", name:"Sign up for a 5k that supports a cause you appreciate"),
    Activity(title:"Give", name:"Support a small business near you, tip excessively if applicable"),
    Activity(title:"Pray", name:"Pray for the people of another country"),
    Activity(title:"Community", name:"Talk to a missionary about their passion for ministry"),
    Activity(title:"Community", name:"Tell your story to someone who has not heard it"),
    Activity(title:"Journal", name:"Read through your journal from this time last year"),
    Activity(title:"Give", name:"Make some bags of things for the homeless people you see as you are driving around."),
    Activity(title:"Pray", name:"Walk around your house praying for protection, peace, joy, love, growth, kindness, that it would be filled with the holy spirit."),
    Activity(title:"Fast", name:"Leave the TV off today"),
    Activity(title:"Pray", name:"Pray about how to take a recurring sin out by the roots"),
    Activity(title:"Fast", name:"Fast through two meals today praying about those who do not have enough to eat"),
    Activity(title:"Community", name:"Call a friend and praise a specific attribute that you admire about them."),
    Activity(title:"Study", name:"Study baptism"),
    Activity(title:"Study", name:"Commit a scripture verse to memory "),
    Activity(title:"Read", name:"Read 1 John"),
    Activity(title:"Study", name:"Do a study on the word love"),
    Activity(title:"Journal", name:"Write down three things you are thankful for and tell someone about them"),
    Activity(title:"Music", name:"Take some extra time to worship God"),
    Activity(title:"Community ", name:"Invite someone new from church to lunch."),
    Activity(title:"Pray", name:"Ask God to reveal Himself to you"),
    Activity(title:"Music", name:"Listen to only Christian music this week"),
    Activity(title:"Bible Study", name:"Pick a chapter in the Bible and read it several times throughout the day ask God to speak to you through His Word. Focus on and pray about what stands out. "),
    Activity(title:"Bible Study", name:"Journal through a chapter Psalm 19 today."),
    Activity(title:"Bible Study", name:"Time spent reading a certain passage of the Bible. Usually several times through. I pray as I read and ask God to speak to me through His Word. Focus on and pray about what stands out . Sometimes regarding related passages. "),
    Activity(title:"Bible Study", name:"This is an intentionally short and usually simple devotional time. My preference is to do it first thing in the morning so that my mind has something kingdom related to dwell on right away. / Separate from doing devotionals to fix my eyes on Jesus  early, I also just read. If I'm in a unique season I'll try and find a portion of the bible that parallels. If not I'll just pick a book of the bible "),
    Activity(title:"Pray", name:"As needs for others arise (myself too), ask God's help and blessing."),
    Activity(title:"Pray", name:"Set an alarm to pray on the hour about whatever is on your mind."),
    Activity(title:"Pray", name:"Pray using ACTS model.\nAdoration - focus on attributes of God, who He is\nConfession - focus on confession of my sin and struggle s, who I am.\nThanksgiving - Thank the Lord for something\nSupplication - asking for what I need"),
    Activity(title:"Pray", name:"Ask someone today how you can pray for them. how I can be praying with/for them and listen for opportunity to pray for those I can't ask. I make a list and commit to specific days/times that I pray for everyone. I look for scripture that may apply. Last but not least I follow up on those that I can with each person."),
    Activity(title:"Bible Study", name:"Spend time weekly reading."),
    Activity(title:"Fast", name:"Focusing on God more than food or something else. "),
    Activity(title:"Pray", name:"As you are walking or driving, dedicate this time to pray for others. "),
    Activity(title:"Pray", name:"Listen to people today and take time to pray about their needs that have come up."),
    Activity(title:"Pray ", name:"Talk to god about anything "),
    Activity(title:"Give", name:"Pray for an opportunity to meet a need someone has."),
    Activity(title:"Worship ", name:"Talking to god through music "),
    Activity(title:"Community", name:"Celebrate with someone today in the name of the Lord."),
    Activity(title:"Bible Study", name:"Read the Word for 20 minutes today"),
    Activity(title:"Community", name:"Talk and listen to other people about god "),
    Activity(title:"Community", name:"Do an act of service for someone today."),
    Activity(title:"Pray", name:"Ask God to forgive you of a sin you have been carrying around. "),
    Activity(title:"Pray", name:"Praise the Lord for something He has given you (talent, health, family, friends, etc)")


]



struct Activity: Identifiable {
    let title: String
    let name: String
    //let resource: String
    let id = UUID()
    
    
    }
    
    

