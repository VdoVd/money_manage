import { data, timeClass } from './data'

@CustomDialog
export default struct timeDialog{

  controller:CustomDialogController
  @State selectedTime:Date=new Date()
  @State selectYear:number=0
  @State selectMouth:number=0
  @State data:timeClass={} as timeClass
  @Link mouth:string
  @Link year:string
  @Consume findStore:boolean

  aboutToAppear(): void {
    this.data=data()
    this.selectYear=this.data.year.indexOf(this.year)
    this.selectMouth=this.data.mouth.indexOf(this.mouth)
  }

  build() {
    Column(){
      Row(){

        TextPicker({range:this.data.year,selected:this.selectYear})
          .onChange((value:string|string[],index:number[]|number)=>{

            this.year=value.toString()
          })

        TextPicker({range:this.data.mouth,selected:this.selectMouth})
          .onChange((value:string|string[],index:number[]|number)=>{
              this.mouth=value.toString()
          })

      }
      Row(){
        Button('取消')
          .onClick(()=>{
            this.controller.close()
          })
        Button('确定')
          .onClick(()=>{
            this.controller.close()
            this.findStore=true
          })
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)
    }
  }

}