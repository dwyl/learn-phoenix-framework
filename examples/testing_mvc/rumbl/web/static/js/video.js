/***
 * Excerpted from "Programming Phoenix",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
***/
import Player from "./player"

let Video = {

  init(socket, element){ if(!element){ return }
    let msgContainer = document.getElementById("msg-container")
    let msgInput     = document.getElementById("msg-input")
    let postButton   = document.getElementById("msg-submit")
    let videoId      = element.getAttribute("data-id")
    let playerId     = element.getAttribute("data-player-id")
    Player.init(element.id, playerId)

    socket.connect()
    let vidChannel = socket.channel("videos:" + videoId)

    postButton.addEventListener("click", e => {
      console.log(Player.getCurrentTime())
      let payload = {body: msgInput.value, at: Player.getCurrentTime()}
      vidChannel.push("new_annotation", payload)        
                .receive("error", e => console.log(e) ) 
      msgInput.value = ""
    })

    vidChannel.on("new_annotation", (resp) => {         
      this.renderAnnotation(msgContainer, resp)
    })

    msgContainer.addEventListener("click", e => {
      e.preventDefault()
      let seconds = e.target.getAttribute("data-seek")
      if(!seconds){ return }

      Player.seekTo(seconds)
    })

    vidChannel.join()
      .receive("ok", resp => {
        this.scheduleMessages(msgContainer, resp.annotations)
      })
      .receive("error", reason => console.log("join failed", reason) )
  },

  renderAnnotation(msgContainer, {user, body, at}){
    let template = document.createElement("div")
    template.innerHTML = `
    <a href="#" data-seek="${at}">
      [${this.formatTime(at)}] <b>${user.username}</b>: ${body}
    </a>
    `
    msgContainer.appendChild(template)
    msgContainer.scrollTop = msgContainer.scrollHeight
  },

  scheduleMessages(msgContainer, annotations){
    setTimeout(() => {
      let ctime = Player.getCurrentTime()
      let remaining = this.renderAtTime(annotations, ctime, msgContainer)
      this.scheduleMessages(msgContainer, remaining)
    }, 1000)
  },

  renderAtTime(annotations, seconds, msgContainer){
    return annotations.filter( ann => {
      if(ann.at > seconds){
        return true
      } else {
        this.renderAnnotation(msgContainer, ann)
        return false
      }
    })
  },

  formatTime(at){
    let date = new Date(null)
    date.setSeconds(at / 1000)
    return date.toISOString().substr(14, 5)
  }
}
export default Video

// import Player from "./player"

// let Video = {

//   init(socket, element){ if(!element){ return }
//     let msgContainer = document.getElementById("msg-container")
//     let msgInput     = document.getElementById("msg-input")
//     let postButton   = document.getElementById("msg-submit")
//     let videoId      = element.getAttribute("data-id")
//     let playerId     = element.getAttribute("data-player-id")
//     Player.init(element.id, playerId)

//     socket.connect()
//     let vidChannel = socket.channel("videos:" + videoId)

//     postButton.addEventListener("click", e => {
//       console.log(Player.getCurrentTime())
//       let payload = {body: msgInput.value, at: Player.getCurrentTime()}
//       vidChannel.push("new_annotation", payload)        
//                 .receive("error", e => console.log(e) ) 
//       msgInput.value = ""
//     })

//     vidChannel.on("new_annotation", ({annotation}) => {         
//       this.renderAnnotation(msgContainer, annotation)
//     })

//     
//     msgContainer.addEventListener("click", e => {
//       let seconds = e.target.getAttribute("data-seek")
//       if(!seconds){ return }
//       e.preventDefault()

//       Player.seekTo(seconds)
//     })
//     

//     vidChannel.join()
//       .receive("ok", resp => {
//         Player.onReady( () => this.scheduleMessages(msgContainer, resp.annotations))
//       })
//       .receive("error", reason => console.log("join failed", reason) )
//   },

//   renderAnnotation(msgContainer, {src, url, user, body, at}){
//     let template = document.createElement("div")
//     template.innerHTML = `
//     <a href="#" data-seek="${at}">[${this.formatTime(at)}]</a>
//     <a href="${url || '#'}" target="_blank"><b>${src || user.username}</b>: ${body}</a>
//     `
//     msgContainer.appendChild(template)
//     msgContainer.scrollTop = msgContainer.scrollHeight
//   },

//   scheduleMessages(msgContainer, annotations){
//     setTimeout(() => {
//       let ctime = Player.getCurrentTime()
//       let remaining = this.renderAtTime(annotations, ctime, msgContainer)
//       this.scheduleMessages(msgContainer, remaining)
//     }, 1000)
//   },

//   renderAtTime(annotations, seconds, msgContainer){
//     return annotations.filter( ann => {
//       if(ann.at > seconds){
//         return true
//       } else {
//         this.renderAnnotation(msgContainer, ann)
//         return false
//       }
//     })
//   },

//   formatTime(at){
//     let date = new Date(null)
//     date.setSeconds(at / 1000)
//     return date.toISOString().substr(14, 5)
//   }
// }
// export default Video
