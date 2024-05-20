@Component
export default struct searchItemVIew{

  @Consume sv:string[]

  @Consume  @Watch("change") searchFlag:boolean

  @Consume SearchKeys:string[]

  @Prop index:number

  @State val:string=this.sv[this.index]

  title:string=this.sv[this.index]

  change(){

    if(this.searchFlag===true){

      this.sv[this.index]=this.val

      this.sv=[...this.sv]

    }

  }

  build() {

    Row({space:10}){

      Text(this.SearchKeys[this.index]+':')
        .fontSize(15)

      TextInput({text:$$this.val})
        .width('70%')
        .backgroundColor('rgba(0,0,0,0.3)')
        .fontColor(Color.Gray)
        .placeholderFont({size:30})
        .fontSize(15)
        .height(33)


    }.width('90%').justifyContent(FlexAlign.SpaceBetween)

  }

}