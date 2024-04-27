import Sidebar from "./components/Sidebar";
   import BoardTasks from "./components/Home";

   export default function Home() {
   return (
    <main className="flex h-full">
      <Sidebar />
      <Home />
    </main>
   );
   }