@Component
export default struct mine{
  @State avatar:string=''
  build() {
    Column(){

      Row({space:20}){

        Image($r(this.avatar))
          .width(80)

        Text('登录/注册').fontColor(Color.Black)

      }.width('100%')
      .justifyContent(FlexAlign.Start)


    }
  }
}