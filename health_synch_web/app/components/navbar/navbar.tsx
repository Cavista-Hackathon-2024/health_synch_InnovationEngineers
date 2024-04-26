export default function Navbar() {

    return (
      <nav className="bg-white border flex h-24">
        <div className="flex-none w-[18.75rem] border-r-2 flex items-center pl-[2.12rem]">
          <p className="font-bold text-3xl"> Kanban App </p>
        </div>
    
       <div className="flex justify-between w-full items-center pr-[2.12rem]">
           <p className="text-black text-2xl font-bold pl-6">
             Health Synch
           </p>     
          </div>
        </nav>
      )}