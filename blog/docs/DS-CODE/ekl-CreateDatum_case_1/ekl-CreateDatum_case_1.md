---
title: ekl-CreateDatum_case_1 
keywords: ekl-CreateDatum_case_1, catia 
desc: ekl-CreateDatum_case_1 
author: designer 
date: 2021-03-14 
tags: hello, blog, teedoc 
cover: ./assets/cover.jpg 
---


```java

let pln (plane)
let i(integer)
let fill(surface)
let intt(curve)
i =1

for i while i <= 20
{

	intt=intersect( planeoffset(`xy plane`,i*3200mm,true),ddd\Extrude.1)
	fill= fill(intt)
	fill = CreateOrModifyDatum("Surface",`Geometrical Set.1`,`Relations\Knowledge Pattern.1\List.1`,i)
	fill.Name = "S-" + ToString(i)
	fill.Color = "120,20,255"
}


```