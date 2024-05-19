@Component
export default struct SelectMoneyView{

  @Prop arr:string[]

  @Consume selectCount:number

  build() {
    Flex({wrap:FlexWrap.Wrap}){
      ForEach(this.arr,(item:string,index:number)=>{
        Text(item).width('25%')
          .textAlign(TextAlign.Center)
          .padding(10)
          .onClick(()=>{
            this.selectCount=index
          })
          .fontColor(this.selectCount===index?Color.Black:Color.Gray)
      })
    }
  }

}