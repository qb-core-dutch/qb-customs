import axios, { AxiosError } from "axios";

export interface Option {}

export interface Tab {
  name: string;
  label: string;
  subCategories?: Tab[];
  options?: Option[];
}

export function axiosPost(name: string, body?: Object): any {
  const resp = axios({
    url: `https://qb-customs/${name}`,
    method: "post",
    data: body || {},
  });

  resp.catch((err: AxiosError) => {
    if (err) {
      if (axios.isAxiosError(err)) {
        console.error("axios error: " + err.message);
      } else {
        console.error("unknown error: " + err);
      }
    }
  });

  return resp;
}

export const Tabs = [
  {
    name: "engine",
    label: "Engine Upgrade",
  },
  {
    name: "brake",
    label: "Brake Upgrade",
  },
  {
    name: "transmission",
    label: "Transmission Upgrade",
  },
  {
    name: "suspension",
    label: "Suspension Upgrade",
  },
  {
    name: "turbo",
    label: "Turbo Upgrade",
  },
  {
    name: "horns",
    label: "Horns",
  },
  {
    name: "respray",
    label: "Respray",
    subCategories: [
      {
        name: "metallics",
        label: "Metallics",
        subCategories: [
          {
            name: "test",
            label: "Test",
          },
        ],
      },
      {
        name: "glossy",
        label: "Glossy",
      },
    ],
  },
  {
    name: "wheels",
    label: "Wheels",
  },
  {
    name: "liveries",
    label: "Liveries",
  },
  {
    name: "armor",
    label: "Armor",
  },
  {
    name: "extras",
    label: "Extras",
  },
  {
    name: "plate",
    label: "Plate",
  },
  {
    name: "xeons",
    label: "Xeons",
  },
  {
    name: "neons",
    label: "Neons",
  },
  {
    name: "window_tint",
    label: "Window Tint",
  },
];
