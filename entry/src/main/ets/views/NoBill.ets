@Component
export default struct NoBill{

  build() {
    Column(){
      Text('本月无账单').fontColor(Color.Gray)
    }
    .height('100%').width('100%')
  }

}