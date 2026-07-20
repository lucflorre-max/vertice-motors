import { createClient } from "@supabase/supabase-js";

export type Role = "admin" | "manager" | "agent";
export type UserStatus = "pending" | "active" | "blocked";
export type VehicleStatus = "draft" | "available" | "reserved" | "sold";

export type Vehicle = {
  id: string; name: string; brand: string; model: string; year: number;
  mileage: number; price: number; category: string; transmission: string;
  fuel: string; color: string; description: string | null; cover_url: string | null;
  featured: boolean; status: VehicleStatus; created_at: string;
};

export type Lead = {
  id: string; name: string; phone: string; email: string | null;
  source: string; subject: string; vehicle_id: string | null;
  status: "new" | "contacted" | "qualified" | "won" | "lost";
  notes: string | null; assigned_to: string | null; created_at: string;
};

export const supabase = () => {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !key) throw new Error("Configure NEXT_PUBLIC_SUPABASE_URL e NEXT_PUBLIC_SUPABASE_ANON_KEY");
  return createClient(url, key);
};
