"use strict";var Zn=Object.create;var J=Object.defineProperty;var Qn=Object.getOwnPropertyDescriptor;var Yn=Object.getOwnPropertyNames;var Jn=Object.getPrototypeOf,er=Object.prototype.hasOwnProperty;var d=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),tr=(e,t)=>{for(var n in t)J(e,n,{get:t[n],enumerable:!0})},ze=(e,t,n,r)=>{if(t&&typeof t=="object"||typeof t=="function")for(let o of Yn(t))!er.call(e,o)&&o!==n&&J(e,o,{get:()=>t[o],enumerable:!(r=Qn(t,o))||r.enumerable});return e};var v=(e,t,n)=>(n=e!=null?Zn(Jn(e)):{},ze(t||!e||!e.__esModule?J(n,"default",{value:e,enumerable:!0}):n,e)),nr=e=>ze(J({},"__esModule",{value:!0}),e);var nt=d((_s,tt)=>{tt.exports=et;et.sync=or;var Ye=require("fs");function rr(e,t){var n=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!n||(n=n.split(";"),n.indexOf("")!==-1))return!0;for(var r=0;r<n.length;r++){var o=n[r].toLowerCase();if(o&&e.substr(-o.length).toLowerCase()===o)return!0}return!1}function Je(e,t,n){return!e.isSymbolicLink()&&!e.isFile()?!1:rr(t,n)}function et(e,t,n){Ye.stat(e,function(r,o){n(r,r?!1:Je(o,e,t))})}function or(e,t){return Je(Ye.statSync(e),e,t)}});var at=d((Es,it)=>{it.exports=ot;ot.sync=sr;var rt=require("fs");function ot(e,t,n){rt.stat(e,function(r,o){n(r,r?!1:st(o,t))})}function sr(e,t){return st(rt.statSync(e),t)}function st(e,t){return e.isFile()&&ir(e,t)}function ir(e,t){var n=e.mode,r=e.uid,o=e.gid,s=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),l=parseInt("010",8),u=parseInt("001",8),y=a|l,g=n&u||n&l&&o===i||n&a&&r===s||n&y&&s===0;return g}});var lt=d((vs,ct)=>{var bs=require("fs"),te;process.platform==="win32"||global.TESTING_WINDOWS?te=nt():te=at();ct.exports=ye;ye.sync=ar;function ye(e,t,n){if(typeof t=="function"&&(n=t,t={}),!n){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(r,o){ye(e,t||{},function(s,i){s?o(s):r(i)})})}te(e,t||{},function(r,o){r&&(r.code==="EACCES"||t&&t.ignoreErrors)&&(r=null,o=!1),n(r,o)})}function ar(e,t){try{return te.sync(e,t||{})}catch(n){if(t&&t.ignoreErrors||n.code==="EACCES")return!1;throw n}}});var wt=d((Is,ht)=>{var q=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",ut=require("path"),cr=q?";":":",dt=lt(),pt=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),ft=(e,t)=>{let n=t.colon||cr,r=e.match(/\//)||q&&e.match(/\\/)?[""]:[...q?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(n)],o=q?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",s=q?o.split(n):[""];return q&&e.indexOf(".")!==-1&&s[0]!==""&&s.unshift(""),{pathEnv:r,pathExt:s,pathExtExe:o}},mt=(e,t,n)=>{typeof t=="function"&&(n=t,t={}),t||(t={});let{pathEnv:r,pathExt:o,pathExtExe:s}=ft(e,t),i=[],a=u=>new Promise((y,g)=>{if(u===r.length)return t.all&&i.length?y(i):g(pt(e));let m=r[u],E=/^".*"$/.test(m)?m.slice(1,-1):m,_=ut.join(E,e),S=!E&&/^\.[\\\/]/.test(e)?e.slice(0,2)+_:_;y(l(S,u,0))}),l=(u,y,g)=>new Promise((m,E)=>{if(g===o.length)return m(a(y+1));let _=o[g];dt(u+_,{pathExt:s},(S,C)=>{if(!S&&C)if(t.all)i.push(u+_);else return m(u+_);return m(l(u,y,g+1))})});return n?a(0).then(u=>n(null,u),n):a(0)},lr=(e,t)=>{t=t||{};let{pathEnv:n,pathExt:r,pathExtExe:o}=ft(e,t),s=[];for(let i=0;i<n.length;i++){let a=n[i],l=/^".*"$/.test(a)?a.slice(1,-1):a,u=ut.join(l,e),y=!l&&/^\.[\\\/]/.test(e)?e.slice(0,2)+u:u;for(let g=0;g<r.length;g++){let m=y+r[g];try{if(dt.sync(m,{pathExt:o}))if(t.all)s.push(m);else return m}catch{}}}if(t.all&&s.length)return s;if(t.nothrow)return null;throw pt(e)};ht.exports=mt;mt.sync=lr});var Se=d((Ps,ge)=>{"use strict";var yt=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(r=>r.toUpperCase()==="PATH")||"Path"};ge.exports=yt;ge.exports.default=yt});var _t=d((Ts,xt)=>{"use strict";var gt=require("path"),ur=wt(),dr=Se();function St(e,t){let n=e.options.env||process.env,r=process.cwd(),o=e.options.cwd!=null,s=o&&process.chdir!==void 0&&!process.chdir.disabled;if(s)try{process.chdir(e.options.cwd)}catch{}let i;try{i=ur.sync(e.command,{path:n[dr({env:n})],pathExt:t?gt.delimiter:void 0})}catch{}finally{s&&process.chdir(r)}return i&&(i=gt.resolve(o?e.options.cwd:"",i)),i}function pr(e){return St(e)||St(e,!0)}xt.exports=pr});var Et=d((As,_e)=>{"use strict";var xe=/([()\][%!^"`<>&|;, *?])/g;function fr(e){return e=e.replace(xe,"^$1"),e}function mr(e,t){return e=`${e}`,e=e.replace(/(?=(\\+?)?)\1"/g,'$1$1\\"'),e=e.replace(/(?=(\\+?)?)\1$/,"$1$1"),e=`"${e}"`,e=e.replace(xe,"^$1"),t&&(e=e.replace(xe,"^$1")),e}_e.exports.command=fr;_e.exports.argument=mr});var vt=d((Cs,bt)=>{"use strict";bt.exports=/^#!(.*)/});var Pt=d((Rs,It)=>{"use strict";var hr=vt();It.exports=(e="")=>{let t=e.match(hr);if(!t)return null;let[n,r]=t[0].replace(/#! ?/,"").split(" "),o=n.split("/").pop();return o==="env"?r:r?`${o} ${r}`:o}});var At=d((Gs,Tt)=>{"use strict";var Ee=require("fs"),wr=Pt();function yr(e){let n=Buffer.alloc(150),r;try{r=Ee.openSync(e,"r"),Ee.readSync(r,n,0,150,0),Ee.closeSync(r)}catch{}return wr(n.toString())}Tt.exports=yr});var $t=d(($s,Gt)=>{"use strict";var gr=require("path"),Ct=_t(),Rt=Et(),Sr=At(),xr=process.platform==="win32",_r=/\.(?:com|exe)$/i,Er=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function br(e){e.file=Ct(e);let t=e.file&&Sr(e.file);return t?(e.args.unshift(e.file),e.command=t,Ct(e)):e.file}function vr(e){if(!xr)return e;let t=br(e),n=!_r.test(t);if(e.options.forceShell||n){let r=Er.test(t);e.command=gr.normalize(e.command),e.command=Rt.command(e.command),e.args=e.args.map(s=>Rt.argument(s,r));let o=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${o}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Ir(e,t,n){t&&!Array.isArray(t)&&(n=t,t=null),t=t?t.slice(0):[],n=Object.assign({},n);let r={command:e,args:t,options:n,file:void 0,original:{command:e,args:t}};return n.shell?r:vr(r)}Gt.exports=Ir});var kt=d((Ns,Ot)=>{"use strict";var be=process.platform==="win32";function ve(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Pr(e,t){if(!be)return;let n=e.emit;e.emit=function(r,o){if(r==="exit"){let s=Nt(o,t);if(s)return n.call(e,"error",s)}return n.apply(e,arguments)}}function Nt(e,t){return be&&e===1&&!t.file?ve(t.original,"spawn"):null}function Tr(e,t){return be&&e===1&&!t.file?ve(t.original,"spawnSync"):null}Ot.exports={hookChildProcess:Pr,verifyENOENT:Nt,verifyENOENTSync:Tr,notFoundError:ve}});var Ft=d((Os,F)=>{"use strict";var Lt=require("child_process"),Ie=$t(),Pe=kt();function qt(e,t,n){let r=Ie(e,t,n),o=Lt.spawn(r.command,r.args,r.options);return Pe.hookChildProcess(o,r),o}function Ar(e,t,n){let r=Ie(e,t,n),o=Lt.spawnSync(r.command,r.args,r.options);return o.error=o.error||Pe.verifyENOENTSync(o.status,r),o}F.exports=qt;F.exports.spawn=qt;F.exports.sync=Ar;F.exports._parse=Ie;F.exports._enoent=Pe});var Bt=d((ks,Mt)=>{"use strict";Mt.exports=e=>{let t=typeof e=="string"?`
`:10,n=typeof e=="string"?"\r":13;return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===n&&(e=e.slice(0,e.length-1)),e}});var jt=d((Ls,X)=>{"use strict";var z=require("path"),Dt=Se(),Ut=e=>{e={cwd:process.cwd(),path:process.env[Dt()],execPath:process.execPath,...e};let t,n=z.resolve(e.cwd),r=[];for(;t!==n;)r.push(z.join(n,"node_modules/.bin")),t=n,n=z.resolve(n,"..");let o=z.resolve(e.cwd,e.execPath,"..");return r.push(o),r.concat(e.path).join(z.delimiter)};X.exports=Ut;X.exports.default=Ut;X.exports.env=e=>{e={env:process.env,...e};let t={...e.env},n=Dt({env:t});return e.path=t[n],t[n]=X.exports(e),t}});var Ht=d((qs,Te)=>{"use strict";var Wt=(e,t)=>{for(let n of Reflect.ownKeys(t))Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n));return e};Te.exports=Wt;Te.exports.default=Wt});var Xt=d((Fs,re)=>{"use strict";var Cr=Ht(),ne=new WeakMap,zt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let n,r=0,o=e.displayName||e.name||"<anonymous>",s=function(...i){if(ne.set(s,++r),r===1)n=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${o}\` can only be called once`);return n};return Cr(s,e),ne.set(s,r),s};re.exports=zt;re.exports.default=zt;re.exports.callCount=e=>{if(!ne.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return ne.get(e)}});var Kt=d(oe=>{"use strict";Object.defineProperty(oe,"__esModule",{value:!0});oe.SIGNALS=void 0;var Rr=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];oe.SIGNALS=Rr});var Ae=d(M=>{"use strict";Object.defineProperty(M,"__esModule",{value:!0});M.SIGRTMAX=M.getRealtimeSignals=void 0;var Gr=function(){let e=Zt-Vt+1;return Array.from({length:e},$r)};M.getRealtimeSignals=Gr;var $r=function(e,t){return{name:`SIGRT${t+1}`,number:Vt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},Vt=34,Zt=64;M.SIGRTMAX=Zt});var Qt=d(se=>{"use strict";Object.defineProperty(se,"__esModule",{value:!0});se.getSignals=void 0;var Nr=require("os"),Or=Kt(),kr=Ae(),Lr=function(){let e=(0,kr.getRealtimeSignals)();return[...Or.SIGNALS,...e].map(qr)};se.getSignals=Lr;var qr=function({name:e,number:t,description:n,action:r,forced:o=!1,standard:s}){let{signals:{[e]:i}}=Nr.constants,a=i!==void 0;return{name:e,number:a?i:t,description:n,supported:a,action:r,forced:o,standard:s}}});var Jt=d(B=>{"use strict";Object.defineProperty(B,"__esModule",{value:!0});B.signalsByNumber=B.signalsByName=void 0;var Fr=require("os"),Yt=Qt(),Mr=Ae(),Br=function(){return(0,Yt.getSignals)().reduce(Dr,{})},Dr=function(e,{name:t,number:n,description:r,supported:o,action:s,forced:i,standard:a}){return{...e,[t]:{name:t,number:n,description:r,supported:o,action:s,forced:i,standard:a}}},Ur=Br();B.signalsByName=Ur;var jr=function(){let e=(0,Yt.getSignals)(),t=Mr.SIGRTMAX+1,n=Array.from({length:t},(r,o)=>Wr(o,e));return Object.assign({},...n)},Wr=function(e,t){let n=Hr(e,t);if(n===void 0)return{};let{name:r,description:o,supported:s,action:i,forced:a,standard:l}=n;return{[e]:{name:r,number:e,description:o,supported:s,action:i,forced:a,standard:l}}},Hr=function(e,t){let n=t.find(({name:r})=>Fr.constants.signals[r]===e);return n!==void 0?n:t.find(r=>r.number===e)},zr=jr();B.signalsByNumber=zr});var tn=d((js,en)=>{"use strict";var{signalsByName:Xr}=Jt(),Kr=({timedOut:e,timeout:t,errorCode:n,signal:r,signalDescription:o,exitCode:s,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":n!==void 0?`failed with ${n}`:r!==void 0?`was killed with ${r} (${o})`:s!==void 0?`failed with exit code ${s}`:"failed",Vr=({stdout:e,stderr:t,all:n,error:r,signal:o,exitCode:s,command:i,escapedCommand:a,timedOut:l,isCanceled:u,killed:y,parsed:{options:{timeout:g}}})=>{s=s===null?void 0:s,o=o===null?void 0:o;let m=o===void 0?void 0:Xr[o].description,E=r&&r.code,S=`Command ${Kr({timedOut:l,timeout:g,errorCode:E,signal:o,signalDescription:m,exitCode:s,isCanceled:u})}: ${i}`,C=Object.prototype.toString.call(r)==="[object Error]",O=C?`${S}
${r.message}`:S,b=[O,t,e].filter(Boolean).join(`
`);return C?(r.originalMessage=r.message,r.message=b):r=new Error(b),r.shortMessage=O,r.command=i,r.escapedCommand=a,r.exitCode=s,r.signal=o,r.signalDescription=m,r.stdout=e,r.stderr=t,n!==void 0&&(r.all=n),"bufferedData"in r&&delete r.bufferedData,r.failed=!0,r.timedOut=!!l,r.isCanceled=u,r.killed=y&&!l,r};en.exports=Vr});var rn=d((Ws,Ce)=>{"use strict";var ie=["stdin","stdout","stderr"],Zr=e=>ie.some(t=>e[t]!==void 0),nn=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return ie.map(r=>e[r]);if(Zr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${ie.map(r=>`\`${r}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let n=Math.max(t.length,ie.length);return Array.from({length:n},(r,o)=>t[o])};Ce.exports=nn;Ce.exports.node=e=>{let t=nn(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var on=d((Hs,ae)=>{ae.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&ae.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&ae.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var un=d((zs,j)=>{var h=global.process,R=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};R(h)?(sn=require("assert"),D=on(),an=/^win/i.test(h.platform),K=require("events"),typeof K!="function"&&(K=K.EventEmitter),h.__signal_exit_emitter__?x=h.__signal_exit_emitter__:(x=h.__signal_exit_emitter__=new K,x.count=0,x.emitted={}),x.infinite||(x.setMaxListeners(1/0),x.infinite=!0),j.exports=function(e,t){if(!R(global.process))return function(){};sn.equal(typeof e,"function","a callback must be provided for exit handler"),U===!1&&Re();var n="exit";t&&t.alwaysLast&&(n="afterexit");var r=function(){x.removeListener(n,e),x.listeners("exit").length===0&&x.listeners("afterexit").length===0&&ce()};return x.on(n,e),r},ce=function(){!U||!R(global.process)||(U=!1,D.forEach(function(t){try{h.removeListener(t,le[t])}catch{}}),h.emit=ue,h.reallyExit=Ge,x.count-=1)},j.exports.unload=ce,G=function(t,n,r){x.emitted[t]||(x.emitted[t]=!0,x.emit(t,n,r))},le={},D.forEach(function(e){le[e]=function(){if(R(global.process)){var n=h.listeners(e);n.length===x.count&&(ce(),G("exit",null,e),G("afterexit",null,e),an&&e==="SIGHUP"&&(e="SIGINT"),h.kill(h.pid,e))}}}),j.exports.signals=function(){return D},U=!1,Re=function(){U||!R(global.process)||(U=!0,x.count+=1,D=D.filter(function(t){try{return h.on(t,le[t]),!0}catch{return!1}}),h.emit=ln,h.reallyExit=cn)},j.exports.load=Re,Ge=h.reallyExit,cn=function(t){R(global.process)&&(h.exitCode=t||0,G("exit",h.exitCode,null),G("afterexit",h.exitCode,null),Ge.call(h,h.exitCode))},ue=h.emit,ln=function(t,n){if(t==="exit"&&R(global.process)){n!==void 0&&(h.exitCode=n);var r=ue.apply(this,arguments);return G("exit",h.exitCode,null),G("afterexit",h.exitCode,null),r}else return ue.apply(this,arguments)}):j.exports=function(){return function(){}};var sn,D,an,K,x,ce,G,le,U,Re,Ge,cn,ue,ln});var pn=d((Xs,dn)=>{"use strict";var Qr=require("os"),Yr=un(),Jr=1e3*5,eo=(e,t="SIGTERM",n={})=>{let r=e(t);return to(e,t,n,r),r},to=(e,t,n,r)=>{if(!no(t,n,r))return;let o=oo(n),s=setTimeout(()=>{e("SIGKILL")},o);s.unref&&s.unref()},no=(e,{forceKillAfterTimeout:t},n)=>ro(e)&&t!==!1&&n,ro=e=>e===Qr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",oo=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return Jr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},so=(e,t)=>{e.kill()&&(t.isCanceled=!0)},io=(e,t,n)=>{e.kill(t),n(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},ao=(e,{timeout:t,killSignal:n="SIGTERM"},r)=>{if(t===0||t===void 0)return r;let o,s=new Promise((a,l)=>{o=setTimeout(()=>{io(e,n,l)},t)}),i=r.finally(()=>{clearTimeout(o)});return Promise.race([s,i])},co=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},lo=async(e,{cleanup:t,detached:n},r)=>{if(!t||n)return r;let o=Yr(()=>{e.kill()});return r.finally(()=>{o()})};dn.exports={spawnedKill:eo,spawnedCancel:so,setupTimeout:ao,validateTimeout:co,setExitHandler:lo}});var mn=d((Ks,fn)=>{"use strict";var P=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";P.writable=e=>P(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";P.readable=e=>P(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";P.duplex=e=>P.writable(e)&&P.readable(e);P.transform=e=>P.duplex(e)&&typeof e._transform=="function";fn.exports=P});var wn=d((Vs,hn)=>{"use strict";var{PassThrough:uo}=require("stream");hn.exports=e=>{e={...e};let{array:t}=e,{encoding:n}=e,r=n==="buffer",o=!1;t?o=!(n||r):n=n||"utf8",r&&(n=null);let s=new uo({objectMode:o});n&&s.setEncoding(n);let i=0,a=[];return s.on("data",l=>{a.push(l),o?i=a.length:i+=l.length}),s.getBufferedValue=()=>t?a:r?Buffer.concat(a,i):a.join(""),s.getBufferedLength=()=>i,s}});var yn=d((Zs,V)=>{"use strict";var{constants:po}=require("buffer"),fo=require("stream"),{promisify:mo}=require("util"),ho=wn(),wo=mo(fo.pipeline),de=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function $e(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:n}=t,r=ho(t);return await new Promise((o,s)=>{let i=a=>{a&&r.getBufferedLength()<=po.MAX_LENGTH&&(a.bufferedData=r.getBufferedValue()),s(a)};(async()=>{try{await wo(e,r),o()}catch(a){i(a)}})(),r.on("data",()=>{r.getBufferedLength()>n&&i(new de)})}),r.getBufferedValue()}V.exports=$e;V.exports.buffer=(e,t)=>$e(e,{...t,encoding:"buffer"});V.exports.array=(e,t)=>$e(e,{...t,array:!0});V.exports.MaxBufferError=de});var Sn=d((Qs,gn)=>{"use strict";var{PassThrough:yo}=require("stream");gn.exports=function(){var e=[],t=new yo({objectMode:!0});return t.setMaxListeners(0),t.add=n,t.isEmpty=r,t.on("unpipe",o),Array.prototype.slice.call(arguments).forEach(n),t;function n(s){return Array.isArray(s)?(s.forEach(n),this):(e.push(s),s.once("end",o.bind(null,s)),s.once("error",t.emit.bind(t,"error")),s.pipe(t,{end:!1}),this)}function r(){return e.length==0}function o(s){e=e.filter(function(i){return i!==s}),!e.length&&t.readable&&t.end()}}});var bn=d((Ys,En)=>{"use strict";var _n=mn(),xn=yn(),go=Sn(),So=(e,t)=>{t===void 0||e.stdin===void 0||(_n(t)?t.pipe(e.stdin):e.stdin.end(t))},xo=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let n=go();return e.stdout&&n.add(e.stdout),e.stderr&&n.add(e.stderr),n},Ne=async(e,t)=>{if(e){e.destroy();try{return await t}catch(n){return n.bufferedData}}},Oe=(e,{encoding:t,buffer:n,maxBuffer:r})=>{if(!(!e||!n))return t?xn(e,{encoding:t,maxBuffer:r}):xn.buffer(e,{maxBuffer:r})},_o=async({stdout:e,stderr:t,all:n},{encoding:r,buffer:o,maxBuffer:s},i)=>{let a=Oe(e,{encoding:r,buffer:o,maxBuffer:s}),l=Oe(t,{encoding:r,buffer:o,maxBuffer:s}),u=Oe(n,{encoding:r,buffer:o,maxBuffer:s*2});try{return await Promise.all([i,a,l,u])}catch(y){return Promise.all([{error:y,signal:y.signal,timedOut:y.timedOut},Ne(e,a),Ne(t,l),Ne(n,u)])}},Eo=({input:e})=>{if(_n(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};En.exports={handleInput:So,makeAllStream:xo,getSpawnedResult:_o,validateInputSync:Eo}});var In=d((Js,vn)=>{"use strict";var bo=(async()=>{})().constructor.prototype,vo=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(bo,e)]),Io=(e,t)=>{for(let[n,r]of vo){let o=typeof t=="function"?(...s)=>Reflect.apply(r.value,t(),s):r.value.bind(t);Reflect.defineProperty(e,n,{...r,value:o})}return e},Po=e=>new Promise((t,n)=>{e.on("exit",(r,o)=>{t({exitCode:r,signal:o})}),e.on("error",r=>{n(r)}),e.stdin&&e.stdin.on("error",r=>{n(r)})});vn.exports={mergePromise:Io,getSpawnedPromise:Po}});var An=d((ei,Tn)=>{"use strict";var Pn=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],To=/^[\w.-]+$/,Ao=/"/g,Co=e=>typeof e!="string"||To.test(e)?e:`"${e.replace(Ao,'\\"')}"`,Ro=(e,t)=>Pn(e,t).join(" "),Go=(e,t)=>Pn(e,t).map(n=>Co(n)).join(" "),$o=/ +/g,No=e=>{let t=[];for(let n of e.trim().split($o)){let r=t[t.length-1];r&&r.endsWith("\\")?t[t.length-1]=`${r.slice(0,-1)} ${n}`:t.push(n)}return t};Tn.exports={joinCommand:Ro,getEscapedCommand:Go,parseCommand:No}});var Le=d((ti,W)=>{"use strict";var Oo=require("path"),ke=require("child_process"),ko=Ft(),Lo=Bt(),qo=jt(),Fo=Xt(),pe=tn(),Rn=rn(),{spawnedKill:Mo,spawnedCancel:Bo,setupTimeout:Do,validateTimeout:Uo,setExitHandler:jo}=pn(),{handleInput:Wo,getSpawnedResult:Ho,makeAllStream:zo,validateInputSync:Xo}=bn(),{mergePromise:Cn,getSpawnedPromise:Ko}=In(),{joinCommand:Gn,parseCommand:$n,getEscapedCommand:Nn}=An(),Vo=1e3*1e3*100,Zo=({env:e,extendEnv:t,preferLocal:n,localDir:r,execPath:o})=>{let s=t?{...process.env,...e}:e;return n?qo.env({env:s,cwd:r,execPath:o}):s},On=(e,t,n={})=>{let r=ko._parse(e,t,n);return e=r.command,t=r.args,n=r.options,n={maxBuffer:Vo,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:n.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...n},n.env=Zo(n),n.stdio=Rn(n),process.platform==="win32"&&Oo.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:n,parsed:r}},Z=(e,t,n)=>typeof t!="string"&&!Buffer.isBuffer(t)?n===void 0?void 0:"":e.stripFinalNewline?Lo(t):t,fe=(e,t,n)=>{let r=On(e,t,n),o=Gn(e,t),s=Nn(e,t);Uo(r.options);let i;try{i=ke.spawn(r.file,r.args,r.options)}catch(E){let _=new ke.ChildProcess,S=Promise.reject(pe({error:E,stdout:"",stderr:"",all:"",command:o,escapedCommand:s,parsed:r,timedOut:!1,isCanceled:!1,killed:!1}));return Cn(_,S)}let a=Ko(i),l=Do(i,r.options,a),u=jo(i,r.options,l),y={isCanceled:!1};i.kill=Mo.bind(null,i.kill.bind(i)),i.cancel=Bo.bind(null,i,y);let m=Fo(async()=>{let[{error:E,exitCode:_,signal:S,timedOut:C},O,b,k]=await Ho(i,r.options,u),p=Z(r.options,O),f=Z(r.options,b),A=Z(r.options,k);if(E||_!==0||S!==null){let H=pe({error:E,exitCode:_,signal:S,stdout:p,stderr:f,all:A,command:o,escapedCommand:s,parsed:r,timedOut:C,isCanceled:y.isCanceled,killed:i.killed});if(!r.options.reject)return H;throw H}return{command:o,escapedCommand:s,exitCode:0,stdout:p,stderr:f,all:A,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return Wo(i,r.options.input),i.all=zo(i,r.options),Cn(i,m)};W.exports=fe;W.exports.sync=(e,t,n)=>{let r=On(e,t,n),o=Gn(e,t),s=Nn(e,t);Xo(r.options);let i;try{i=ke.spawnSync(r.file,r.args,r.options)}catch(u){throw pe({error:u,stdout:"",stderr:"",all:"",command:o,escapedCommand:s,parsed:r,timedOut:!1,isCanceled:!1,killed:!1})}let a=Z(r.options,i.stdout,i.error),l=Z(r.options,i.stderr,i.error);if(i.error||i.status!==0||i.signal!==null){let u=pe({stdout:a,stderr:l,error:i.error,signal:i.signal,exitCode:i.status,command:o,escapedCommand:s,parsed:r,timedOut:i.error&&i.error.code==="ETIMEDOUT",isCanceled:!1,killed:i.signal!==null});if(!r.options.reject)return u;throw u}return{command:o,escapedCommand:s,exitCode:0,stdout:a,stderr:l,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};W.exports.command=(e,t)=>{let[n,...r]=$n(e);return fe(n,r,t)};W.exports.commandSync=(e,t)=>{let[n,...r]=$n(e);return fe.sync(n,r,t)};W.exports.node=(e,t,n={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(n=t,t=[]);let r=Rn.node(n),o=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:s=process.execPath,nodeOptions:i=o}=n;return fe(s,[...i,e,...Array.isArray(t)?t:[]],{...n,stdin:void 0,stdout:void 0,stderr:void 0,stdio:r,shell:!1})}});var gs={};tr(gs,{default:()=>Vn,getCachedEnv:()=>Kn});module.exports=nr(gs);var I=require("react"),c=require("@raycast/api");var Ve=v(require("os"),1),L=v(require("fs"),1),ee=v(require("path"),1),Ze=v(require("child_process"),1);function Xe(e){let t=/^: \d+:0;/;return e.trim().split(`
`).map(n=>t.test(n)?n.split(";").slice(1).join(";"):n)}function Ke({extraPaths:e=[]}={}){if(process.env.HISTFILE)return process.env.HISTFILE;let t=Ve.default.homedir(),n=new Set([ee.default.join(t,".bash_history"),ee.default.join(t,".zsh_history"),ee.default.join(t,".history")]);for(let o of e)n.add(o);return(()=>{let o,s=0;for(let i of n)L.default.existsSync(i)&&L.default.statSync(i).size>s&&(s=L.default.statSync(i).size,o=i);return o})()}function Qe(e={}){if(process.platform==="win32"){let t=Ke(e);if(t)return Xe(L.default.readFileSync(t,"utf8"));let{stdout:n}=Ze.default.spawnSync("doskey",["/history"],{encoding:"utf8"});return n.trim().split(`\r
`)}return Xe(L.default.readFileSync(Ke(e),"utf8"))}var he=v(require("node:process"),1),qn=v(Le(),1);function qe({onlyFirst:e=!1}={}){let t=["[\\u001B\\u009B][[\\]()#;?]*(?:(?:(?:(?:;[-a-zA-Z\\d\\/#&.:=?%@~_]+)*|[a-zA-Z\\d]+(?:;[-a-zA-Z\\d\\/#&.:=?%@~_]*)*)?\\u0007)","(?:(?:\\d{1,4}(?:;\\d{0,4})*)?[\\dA-PR-TZcf-ntqry=><~]))"].join("|");return new RegExp(t,e?void 0:"g")}function Fe(e){if(typeof e!="string")throw new TypeError(`Expected a \`string\`, got \`${typeof e}\``);return e.replace(qe(),"")}var me=v(require("node:process"),1),kn=require("node:os"),Qo=()=>{let{env:e}=me.default;if(me.default.platform==="win32")return e.COMSPEC||"cmd.exe";try{let{shell:t}=(0,kn.userInfo)();if(t)return t}catch{}return me.default.platform==="darwin"?e.SHELL||"/bin/zsh":e.SHELL||"/bin/sh"},Yo=Qo(),Ln=Yo;var Jo=["-ilc",'echo -n "_SHELL_ENV_DELIMITER_"; env; echo -n "_SHELL_ENV_DELIMITER_"; exit'],es={DISABLE_AUTO_UPDATE:"true"},ts=e=>{e=e.split("_SHELL_ENV_DELIMITER_")[1];let t={};for(let n of Fe(e).split(`
`).filter(r=>!!r)){let[r,...o]=n.split("=");t[r]=o.join("=")}return t};async function Fn(e){if(he.default.platform==="win32")return he.default.env;try{let{stdout:t}=await(0,qn.default)(e||Ln,Jo,{env:es});return ts(t)}catch(t){if(e)throw t;return he.default.env}}var Ue=require("child_process");var ns=v(require("react"),1),rs=require("react");var Mn=v(require("node:process"),1),Bn=v(Le(),1);async function $(e){if(Mn.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,Bn.default)("osascript",["-e",e]);return t}var os=require("@raycast/api");var Me=require("@raycast/api"),N=require("react");function Be(e,t){let[n,r]=(0,N.useState)(!0),[o,s]=(0,N.useState)(t);(0,N.useEffect)(()=>{let a=!1;return(async()=>{let l=await Me.LocalStorage.getItem(e);typeof l=="string"&&(a||s(JSON.parse(l))),r(!1)})(),()=>{a=!0}},[]);let i=(0,N.useCallback)(a=>{s(l=>{let u=typeof a=="function"?a(l):a;return Me.LocalStorage.setItem(e,JSON.stringify(u)),u})},[]);return[o,i,n]}var Q=v(require("fs"));var w=require("react/jsx-runtime"),T=process.platform==="win32",Dn="${env:ProgramFiles}",is="${env:ProgramFiles(x86)}",as="${env:LocalAppData}",we=null,cs=e=>e.replaceAll("\\","\\\\").replaceAll('"','\\"'),ls=e=>Buffer.from(e,"utf16le").toString("base64"),je=e=>e.replaceAll("'","''"),De=e=>`'-NoLogo','-NoProfile','-NoExit','-Command','${e}'`,We=e=>{T&&(0,Ue.exec)(`powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -EncodedCommand ${ls(e)}`)},us=e=>{let t=je(e);We(`Start-Process PowerShell -ArgumentList ${De(t)}`)},ds=e=>{let t=je(e);We(`Start-Process cmd -ArgumentList '/d','/k','${t}'`)},ps=e=>{let t=je(e);We(`
    $candidatePaths = @(
      "${Dn}\\PowerShell\\7\\pwsh.exe",
      "${Dn}\\PowerShell\\7-preview\\pwsh.exe",
      "${is}\\PowerShell\\7\\pwsh.exe",
      "${as}\\Microsoft\\WindowsApps\\pwsh.exe"
    )
    $pwshExecutable = $candidatePaths | Where-Object { Test-Path $_ } | Select-Object -First 1
    if (-not $pwshExecutable) {
      $pwshCommand = Get-Command pwsh -ErrorAction SilentlyContinue
      if ($pwshCommand) {
        $pwshExecutable = $pwshCommand.Source
      }
    }
    if ($pwshExecutable) {
      Start-Process -FilePath $pwshExecutable -ArgumentList ${De(t)}
    } else {
      Start-Process PowerShell -ArgumentList ${De(t)}
    }
  `)},Y={powershell:{runner:us,label:"PowerShell"},powershell7:{runner:ps,label:"PowerShell 7"},commandprompt:{runner:ds,label:"Command Prompt"}},fs=["powershell7","powershell","commandprompt"],ms=e=>Y[e]?.runner??Y.powershell.runner,hs=e=>Y[e]?.label??Y.powershell.label,ws=e=>T?e.ComSpec||e.COMSPEC||"cmd.exe":e.SHELL||"/bin/zsh",ys=e=>e.PWD||e.HOME||e.USERPROFILE||process.env.PWD||process.env.HOME||process.env.USERPROFILE||(T?process.cwd():`/Users/${process.env.USER??"raycast"}`),Kn=async()=>{if(we)return we;let e=await Fn();return we={env:e,cwd:ys(e),shell:ws(e)},we},Un=({cmd:e})=>{let[t,n]=(0,I.useState)(""),[r,o]=(0,I.useState)(!1);return(0,I.useEffect)(()=>{let s=!1,i=null;return(async()=>{let l=await Kn(),u={env:l.env,cwd:l.cwd,shell:T?l.shell:void 0},y=l.shell||process.env.SHELL||"/bin/zsh",g=T?e:`"${y.replaceAll('"','\\"')}" -i -c "${cs(e)}"`;i=(0,Ue.exec)(g,u),i.stderr?.on("data",m=>{s||(n(m),(0,c.showToast)({style:c.Toast.Style.Failure,title:"Error executing command"}))}),i.stdout?.on("data",m=>{s||((0,c.showToast)({style:c.Toast.Style.Animated,title:"Executing command..."}),n(m))}),i.on("exit",()=>{(0,c.showToast)({style:c.Toast.Style.Success,title:"Command execution complete"}),o(!0)})})(),function(){s=!0,i!==null&&i.kill("SIGTERM")}},[e,n,o]),(0,w.jsx)(c.Detail,{markdown:`\`\`\`
$ ${e} 
 ${t}
\`\`\``,isLoading:!r,actions:(0,w.jsx)(c.ActionPanel,{children:(0,w.jsx)(c.Action.CopyToClipboard,{content:t,shortcut:{modifiers:["cmd"],key:"c"}})})})},jn=e=>{let n=`
    tell application "System Events"
      do shell script "/Applications/kitty.app/Contents/MacOS/kitty -1 kitten @ launch --hold ${e.replaceAll('"','\\"')}"
    end tell
  `;$(n)},Wn=e=>{let t=`
    -- Set this property to true to open in a new window instead of a new tab
    property open_in_new_window : false

    on new_window()
    	tell application "iTerm" to create window with default profile
    end new_window

    on new_tab()
    	tell application "iTerm" to tell the first window to create tab with default profile
    end new_tab

    on call_forward()
    	tell application "iTerm" to activate
    end call_forward

    on is_running()
    	application "iTerm" is running
    end is_running

    on is_processing()
    	tell application "iTerm" to tell the first window to tell current session to get is processing
    end is_processing

    on has_windows()
    	if not is_running() then return false
    	if windows of application "iTerm" is {} then return false
    	true
    end has_windows

    on send_text(custom_text)
    	tell application "iTerm" to tell the first window to tell current session to write text custom_text
    end send_text

    -- Main
    if has_windows() then
      if open_in_new_window then
        new_window()
      else
        new_tab()
      end if
    else
    	-- If iTerm is not running and we tell it to create a new window, we get two
    	-- One from opening the application, and the other from the command
    	if is_running() then
    		new_window()
    	else
    		call_forward()
    	end if
    end if


    -- Make sure a window exists before we continue, or the write may fail
    repeat until has_windows()
    	delay 0.01
    end repeat

    send_text("${e.replaceAll('"','\\"')}")
    call_forward()
  `;$(t)},Hn=e=>{let t=`
      -- For the latest version:
      -- https://github.com/DavidMChan/custom-alfred-warp-scripts

      -- Set this property to true to always open in a new window
      property open_in_new_window : true

      -- Set this property to true to always open in a new tab
      property open_in_new_tab : false

      -- Don't change this :)
      property opened_new_window : false

      -- Handlers
      on new_window()
          tell application "System Events" to tell process "Warp"
              click menu item "New Window" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_window

      on new_tab()
          tell application "System Events" to tell process "Warp"
              click menu item "New Tab" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_tab

      on call_forward()
          tell application "Warp" to activate
      end call_forward

      on is_running()
          application "Warp" is running
      end is_running

      on has_windows()
          if not is_running() then return false
          tell application "System Events"
              if windows of process "Warp" is {} then return false
          end tell
          true
      end has_windows

      on send_text(custom_text)
          tell application "System Events"
              keystroke custom_text
          end tell
      end send_text


      -- Main
      if not is_running() then
          call_forward()
          set opened_new_window to true
      else
          call_forward()
          set opened_new_window to false
      end if

      if has_windows() then
          if open_in_new_window and not opened_new_window then
              new_window()
          else if open_in_new_tab and not opened_new_window then
              new_tab()
          end if
      else
          new_window()
      end if


      -- Make sure a window exists before we continue, or the write may fail
      repeat until has_windows()
          delay 0.5
      end repeat
      delay 0.5

      send_text("${e}")
      call_forward()
  `;$(t)},zn=e=>{let t=`
      -- Set this property to true to always open in a new window
      property open_in_new_window : true

      -- Set this property to true to always open in a new tab
      property open_in_new_tab : false

      -- Reset this property to false
      property opened_new_window : false

      -- Handlers
      on new_window()
          tell application "System Events" to tell process "Ghostty"
              click menu item "New Window" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_window

      on new_tab()
          tell application "System Events" to tell process "Ghostty"
              click menu item "New Tab" of menu "File" of menu bar 1
              set frontmost to true
          end tell
      end new_tab

      on call_forward()
          tell application "Ghostty" to activate
      end call_forward

      on is_running()
          application "Ghostty" is running
      end is_running

      on has_windows()
          if not is_running() then return false
          tell application "System Events"
              if windows of process "Ghostty" is {} then return false
          end tell
          true
      end has_windows

      on send_text(custom_text)
          tell application "System Events"
              keystroke custom_text
          end tell
      end send_text


      -- Main
      if not is_running() then
          call_forward()
          set opened_new_window to true
      else
          call_forward()
          set opened_new_window to false
      end if

      if has_windows() then
          if open_in_new_window and not opened_new_window then
              new_window()
          else if open_in_new_tab and not opened_new_window then
              new_tab()
          end if
      else
          new_window()
      end if


      -- Make sure a window exists before we continue, or the write may fail
      repeat until has_windows()
          delay 0.5
      end repeat
      delay 0.5

      send_text("${e}")
      call_forward()
  `;$(t)},Xn=e=>{let t=`
  tell application "Terminal"
    do script "${e.replaceAll('"','\\"')}"
    activate
  end tell
  `;$(t)};function Vn(e){let[t,n]=(0,I.useState)(""),[r,o]=(0,I.useState)(),[s,i]=Be("recently-used",[]),a=(0,I.useRef)(null),l=Q.default.existsSync("/Applications/iTerm.app"),u=Q.default.existsSync("/Applications/kitty.app"),y=Q.default.existsSync("/Applications/Warp.app"),g=Q.default.existsSync("/Applications/Ghostty.app"),m=p=>{i(f=>f.find(A=>A===p)?f:[p,...f].slice(0,10))};(0,I.useEffect)(()=>{try{let p=Qe().reverse(),f=Array.from(new Set(p)).filter(A=>A.trim().length>0);o(f)}catch(p){console.error("Failed to load shell history",p),o([])}},[]);let{arguments_terminal_type:E,arguments_terminal:_}=(0,c.getPreferenceValues)(),S=E?.toLowerCase?.()??(T?"powershell":"terminal"),C=()=>{if(T)return hs(S);switch(S){case"iterm":return"iTerm";case"kitty":return"Kitty";case"warp":return"Warp";case"ghostty":return"Ghostty";default:return"Terminal"}},O=p=>{if(T){ms(S)(p);return}switch(S){case"kitty":jn(p);break;case"iterm":Wn(p);break;case"warp":Hn(p);break;case"ghostty":zn(p);break;default:Xn(p);break}},b=(p,f)=>{(0,c.closeMainWindow)(),(0,c.popToRoot)(),m(p),f(p)};if((0,I.useEffect)(()=>{if(!e.arguments?.command||!_)return;let p=e.arguments.command,f=`${S}:${p}`;a.current!==f&&(a.current=f,m(p),(0,c.showHUD)(`Ran command in ${C()}`),O(p),(0,c.closeMainWindow)(),(0,c.popToRoot)())},[e.arguments?.command,_,S]),e.arguments?.command)return _?null:(0,w.jsx)(Un,{cmd:e.arguments.command});let k=[];return t&&k.push({category:"New command",items:[t]}),s.length>0&&k.push({category:"Raycast History",items:s.filter(p=>p.includes(t)).slice(0,50)}),r!==void 0&&r.length>0&&k.push({category:"Shell History",items:r.filter(p=>p.includes(t)).slice(0,50)}),(0,w.jsx)(c.List,{isLoading:r===void 0,onSearchTextChange:n,searchText:t,navigationTitle:"Shell command",searchBarPlaceholder:"Enter shell-command",children:k.map(p=>(0,w.jsx)(c.List.Section,{title:p.category,children:p.items.map((f,A)=>(0,w.jsx)(c.List.Item,{icon:c.Icon.Terminal,title:f,actions:(0,w.jsxs)(c.ActionPanel,{children:[(0,w.jsx)(c.Action.Push,{title:"Execute",icon:c.Icon.List,onPush:()=>m(f),target:(0,w.jsx)(Un,{cmd:f})}),s.length>=A?(0,w.jsx)(c.Action,{title:"Edit executed command",icon:c.Icon.Pencil,onAction:()=>{n(f)}}):null,!T&&(0,w.jsxs)(w.Fragment,{children:[u?(0,w.jsx)(c.Action,{title:"Execute in kitty.app",icon:{fileIcon:"/Applications/kitty.app"},onAction:()=>b(f,jn)}):null,l?(0,w.jsx)(c.Action,{title:"Execute in iTerm.app",icon:{fileIcon:"/Applications/iTerm.app"},onAction:()=>b(f,Wn)}):null,g?(0,w.jsx)(c.Action,{title:"Execute in Ghostty.app",icon:{fileIcon:"/Applications/Ghostty.app"},onAction:()=>b(f,zn)}):null,y?(0,w.jsx)(c.Action,{title:"Execute in Warp.app",icon:{fileIcon:"/Applications/Warp.app"},onAction:()=>b(f,Hn)}):null,(0,w.jsx)(c.Action,{title:"Execute in Terminal.app",icon:{fileIcon:"/System/Applications/Utilities/Terminal.app"},onAction:()=>b(f,Xn)})]}),T&&fs.map(H=>{let He=Y[H];return(0,w.jsx)(c.Action,{title:`Execute in ${He.label}`,icon:c.Icon.Terminal,onAction:()=>b(f,He.runner)},H)}),(0,w.jsx)(c.Action.CopyToClipboard,{title:"Copy to Clipboard",content:f,onCopy:()=>{m(f)}})]})},A))},p.category))})}0&&(module.exports={getCachedEnv});
