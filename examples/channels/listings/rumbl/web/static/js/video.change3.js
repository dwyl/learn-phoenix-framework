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
    let playerId = element.getAttribute("data-player-id")
    let videoId  = element.getAttribute("data-id")
    socket.connect()
    Player.init(element.id, playerId, () => {
      this.onReady(videoId, socket)
    })
  },

  onReady(videoId, socket){
    let msgContainer = document.getElementById("msg-container")
    let msgInput     = document.getElementById("msg-input")
    let postButton   = document.getElementById("msg-submit")
    let vidChannel   = socket.channel("videos:" + videoId)

    postButton.addEventListener("click", e => {
      let payload = {body: msgInput.value, at: Player.getCurrentTime()}
      vidChannel.push("new_annotation", payload)        
                .receive("error", e => console.log(e) ) 
      msgInput.value = ""
    })

    vidChannel.on("new_annotation", (resp) => {         
      this.renderAnnotation(msgContainer, resp)
    })

    vidChannel.join()
      .receive("ok", resp => console.log("joined the video channel", resp) )
      .receive("error", reason => console.log("join failed", reason) )
  },

  renderAnnotation(msgContainer, {user, body, at}){
    // TODO append annotation to msgContainer
  }
}
export default Video
