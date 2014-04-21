<@channelList siteId="6ec601fd-69a0-4469-a6f7-d1edb7136481" parId="" navigation="1" state="1";channel,index>
<a onmouseout="pfout()"
   onclick="javascript:window.top.location.href='${channel.pageUrl}'"
   href="${channel.pageUrl}">
    <li
            onmouseover="pfgd(${index+1},this)">
    ${channel.name}
    </li>
</a>
</@channelList>